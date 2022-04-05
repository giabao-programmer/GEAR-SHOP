<?php
include 'inc/header.php';
include 'inc/slider.php';
require_once("config/db.class.php");
require_once("entities/product.class.php");
if (isset($_GET["id"])) {

    # code...
    
    $id = $_GET["id"];
    $prods = reset(Product::get_product($id));
}
$pros = Product::list_prod();
?>
<!----------------------------------- Start product home ----------------------------------->
<section class="py-2 mt-4" style="background-color: aliceblue;">
    <div class="container px-4 ps-lg-5 mt-3">
        <h2 class="homeproduct-title">HOT Products</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
                                <h5 class="productprice"><?php echo $item["price"] ?> vnđ</h5>
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

<!----------------------------------- End product home ----------------------------------->
<?php
include 'inc/footer.php';
?>