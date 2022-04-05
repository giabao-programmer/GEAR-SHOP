<?php
include 'inc/header.php';

use function PHPSTORM_META\type;

include 'admin/includes/db.php';
$total_price = 0;
if (isset($_GET['page'])) {

  $pages = array("details", "cart");

  if (in_array($_GET['page'], $pages)) {

    $_page = $_GET['page'];
  } else {

    $_page = "details";
  }
} else {

  $_page = "details";
}
?>
<!-- Body -->
<div class="container mt-3" style="min-height: 720px">
  <?php
  if (empty($_SESSION['cart'])) :
  ?>
    <div style="text-align: center;">
      <h1 class="py-5">Cart is empty!</h1>
      <a href="index.php" type="button" class="btn btn-danger my-5" style="border-radius: 20px;">Back to shop</a>
    </div>
  <?php
  else :
  ?>
    <div style="text-align: center">
      <h1>Your Cart</h1>
    </div>
    <hr />
    <div class="row py-3">
      <form action="insert_order.php" method="POST">
        <div style=" border: 3px solid red; border-radius: 10px; ">
          <table style="width: 100%">
            <thead>
              <tr>
                <th>Image</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Remove</th>
              </tr>
            </thead>
            <tbody>

              <?php
              $sql = "SELECT * FROM product WHERE productId IN (";

              foreach ($_SESSION['cart'] as $id => $row) {
                $sql .= $id . ",";
              }

              $sql = substr($sql, 0, -1) . ")";
              $query = mysqli_query($con, $sql);
              $totalprice = 0;
              while ($row = mysqli_fetch_array($query)) {
                $subtotal = $_SESSION['cart'][$row['productId']]['quantity'] * $row['price'];
                $totalprice += $subtotal;
              ?>
                <tr>
                  <td><img class="cartimg" src="uploads/<?php echo $row["image"] ?>" alt="" /></td>
                  <td><?php echo $row['productName'] ?></td>
                  <td>
                    <input name="total_price" type="hidden" id="updatetotalprice" value="<?php echo $totalprice ?>">
                    <div class="cart-info quantity">
                      <a type="button" class="btn-increment-decrement" href="cart.php?action=update&id=<?php echo $row["productId"]; ?>&type=decrease">-</a><input type="text" class="cart-quantity" id="input-quantity-<?php echo $row['productId']; ?>" value="<?php echo $_SESSION['cart'][$row['productId']]['quantity']; ?>" disabled>
                      <a type="button" class="btn-increment-decrement" href="cart.php?action=update&id=<?php echo $row["productId"]; ?>&type=increase">+</a>
                    </div>
                  </td>
                  <td><?php echo $subtotal ?> vnđ</td>

                  <td>
                    <a href="cart.php?action=remove&id=<?php echo $row["productId"]; ?>"><i class="fa fa-trash" style="color: black"></i></a>
                  </td>
                </tr>
              <?php
              }
              ?>

              <tr>
                <td colspan="4" style="font-weight: 900">Total:</td>
                <td style="font-weight: 900">
                  <p id="total"><?php echo $totalprice ?></p>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="py-5 center">
          <button onclick="location.href='checkout.php'" type="button" class="btn btn-danger">Checkout</button>
        </div>
      </form>
    </div>
  <?php
  endif;
  ?>
</div>


<!----------------------------------- End product home ----------------------------------->

<!-- Footer-->
<?php
include 'inc/footer.php';
?>