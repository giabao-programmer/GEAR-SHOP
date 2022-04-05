<?php
include './inc/header.php'
?>
<div class="container body1680px pt-4" style="display: block">

    <div style="text-align: center">
        <?php
        if ($_GET['errorCode'] == "49") {
            echo '<h1 class="my-5">Payment failed!</h1>';
        } else {
            $orderid = $_GET['orderId'];
            $cusName = $_POST['cus_name'];
            $cusphone = $_POST['cus_phone'];
            $cusemail = $_POST['cus_email'];
            $address = $_POST['address'];
            $ward = $_POST['ward'];
            $district = $_POST['district'];
            $province = $_POST['province'];
            //add order
            $insert_order = "insert into orders (orderId,cus_name, cus_phone, cus_email,shipAddress, shipProvince, shipDistrict, shipWard) values ('$orderid','$cusName', '$cusphone', '$cusemail', '$address', '$province', '$district', '$ward')";
            $run_order = mysqli_query($con, $insert_order);

            //add orderDetails
            $sql = "SELECT * FROM product WHERE productId IN (";
            foreach ($_SESSION['cart'] as $id => $row) {
                $sql .= $id . ",";
            }
            $sql = substr($sql, 0, -1) . ")";
            $query = mysqli_query($con, $sql);
            $totalprice = 0;
            while ($row = mysqli_fetch_array($query)) {
                $pro_id = $row['productId'];
                $price = $row['price'];
                $pro_qty = $_SESSION['cart'][$row['productId']]['quantity'];
                $insert_orderd = "insert into orderdetails (orderId, productId, unitprice, quantity) values ('$orderid','$pro_id', '$price', '$pro_qty' )";
                $run_orderd = mysqli_query($con, $insert_orderd);
            }
            if ($run_order) {
                echo "<script>alert('Order successfully')</script>";
                echo "<script>window.open('index.php','_self')</script>";
            }
            session_destroy();
        }
        ?>
    </div>
</div>
<hr />
<?php
include 'inc/footer.php';
?>