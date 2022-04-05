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
}
if (isset($_POST["filter"])) {
    $filter = $_POST["filter"];
    if ($filter == "acs") {
        echo "<script>alert('Order successfully')</script>";
    } elseif ($filter == "desc") {
        $pros = Product::list_product_by_cateid_desc($cateid);
    }
}
$cates = Category::list_cate();
?>

</nav>
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
                    <div class="mb-3">
                        <h5 style="display: inline-block;">Filter by: </h5>
                        <form action="" method="POST" style="display: inline-block;">
                            <select name="filter" id="" style="width: 160px; border-radius: 1px; text-align: center;" onchange="this.form.submit()">
                                <option value="" disabled selected>---Select Filter---</option>
                                <option value="desc">Max price</option>
                                <option value="asc">Min price</option>
                            </select>
                        </form>
                    </div>
                    <section>
                        <div class="container px-4 ps-lg-5">
                            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
                                <?php
                                foreach ($pros as $item) {
                                ?>

                                    <div class="col mb-5">

                                        <div class="card h-100">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="uploads/<?php echo $item["image"]; ?>" alt="..." />
                                            <!-- Product details-->
                                            <div class="card-body p-4 pb-2">
                                                <div class="text-center pt-3">
                                                    <!-- Product name-->
                                                    <h6 class="fw-bolder"><?php echo $item["productName"] ?></h6>
                                                    <!-- Product price-->
                                                    <h5 class="productprice"><?php echo $item["price"] ?>đ</h5>
                                                </div>
                                            </div>
                                            <!-- Product actions-->
                                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="details.php?p_id=<?php echo $item["productId"] ?>">View product</a></div>
                                            </div>

                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <div class="col-lg-2" style="width: 11% !important;"><a href="#"><img class="img-right" src="images/banner-right.png" alt=""></a></div>
    </div>
</div>
<!-- Footer-->
<?php
include 'inc/footer.php';
?>
</body>

</html>