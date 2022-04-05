<?php
include 'inc/header.php';
require_once("config/db.class.php");
require_once("entities/product.class.php");
require_once("entities/category.class.php");

if (!isset($_GET["cateid"])) {
    # code...
    $pros = Product::list_prod();
} else {
    $cateid = $_GET["cateid"];
    $pros = Product::list_product_by_cateid($cateid);
    $prods = Product::get_product($p_id);
}

$cates = Category::list_cate();
?>
<?php
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
<?php
include 'admin/includes/db.php';
if (isset($_GET['action']) && $_GET['action'] == "add") {

    $id = intval($_GET['p_id']);

    if (isset($_SESSION['cart'][$id])) {

        $_SESSION['cart'][$id]['quantity']++;
        header("location:cart.php");
    } else {

        $sql_s = "SELECT * FROM product
              WHERE productId={$id}";
        $query_s = mysqli_query($con, $sql_s);
        if (mysqli_num_rows($query_s) != 0) {
            $row_s = mysqli_fetch_array($query_s);

            $_SESSION['cart'][$row_s['productId']] = array(
                "quantity" => 1,
                "price" => $row_s['price']
            );
        }
        header("location:cart.php");
    }
}

?>
<!-- Body -->

<div class="container body1680px pt-4" style="display: block;">
    <div class="row" style="padding-right: 50px; padding-left: 50px;">
        <div class="col-lg-2" style="width: 11% !important;"><a href="#"><img src="images/banner-left.png" alt=""></a></div>
        <div class="col-lg-8" style="width: 78% !important;">
            <div class="row">
                <div class="col-lg-3" style="width: 22% !important;">
                    <nav class="menu-nav">
                        <ul class="nav-menulist">
                            <?php
                            foreach ($cates as $item) {
                                echo "<li>
                                        <a href=productlist.php?cateid=" . $item["categoryId"] . ">
                                            <span><img src='" . $item["CateImage"] . "' alt=''></span>
                                            <span>" . $item["categoryName"] . "</span>
                                        </a>
                                    </li>";
                            };
                            ?>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-9">


                    <?php
                    include 'admin/includes/db.php';
                    $p_id = $_GET['p_id'];
                    $get_p = "select * from product where productId='$p_id'";
                    $run_details = mysqli_query($con, $get_p);
                    $row = mysqli_fetch_array($run_details);
                    ?>

                    <div class="row gx-4 gx-lg-5 ">
                        <div class="col-sm-6"><img class="card-img-top mb-5 mb-md-0" src="uploads/<?php echo $row["image"] ?>" alt="..." /></div>
                        <div class="col-sm-6">
                            <h3 class="fw-bolder"><?php echo $row["productName"] ?></h3>
                            <div class="fs-5 mb-5">
                                <span class="text"><?php echo $row["price"] ?> vnđ</span>
                            </div>
                            <p class="lead">
                                <?php 
                                // echo $row["properties"]
                                $properties = explode(",",$row['properties']);
                                foreach($properties as $item){
                                    echo "$item </br>"; 
                                }
                                ?>
                            </p>
                            <div class="d-flex">
                                <?php

                                if ($row['instock'] == 0) {
                                    echo "
                                <button class='btn btn-outline-red flex-shrink-0' type='button' style='font-weight: 500;'  disabled />
                                    Out of stock
                                </button>
                                ";
                                } else {
                                    echo '
                                <button onclick =\'location.href="details.php?page=details&action=add&p_id=' . $row["productId"] . '"\' class="btn btn-outline-red flex-shrink-0" type="button" style="font-weight: 500;"  />
                                    Add to cart 
                                </button>
                                ';
                                }

                                ?>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="border-color: black;">
                </div>
            </div>
        </div>
        <div class="col-lg-2" style="width: 11% !important;"><a href="#"><img class="img-right" src="images/banner-right.png" alt=""></a></div>
    </div>
    <hr>
    <div class="row">
        <div class="col-lg-12" style="text-align: center;">
            <h4>Description</h4>
            <div class="my-4">
                <?php echo $row["description"] ?>
            </div>
        </div>
    </div>
</div>


<!-- Footer-->
<?php
include 'inc/footer.php';
?>