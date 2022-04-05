<?php

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
$cates = Category::list_cate();
?>
<!-- Body -->
<div class="container body1680px pt-4" style="display: block;">
    <div class="row" style="padding-right: 50px; padding-left: 50px;">
        <div class="col-lg-2" style="width: 11% !important;"><a href="#"><img src="images/banner-left.png" alt=""></a></div>
        <div class="col-lg-8" style="width: 78% !important;">
            <div class="row">
                <div class="col-lg-3" style="width: 18% !important;">
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
                    </nav>
                </div>
                <div class="col-lg-7">
                    <div class="tophome">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="images/carousel/slideshow_1.webp" class="d-block w-100" alt="Manhinhchinhhang">
                                </div>
                                <div class="carousel-item">
                                    <img src="images/carousel/slideshow_2.webp" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="images/carousel/slideshow_3.webp" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="bottomhome">
                        <img src="images/bottom_carousel/bot_1.webp" alt="">
                        <img src="images/bottom_carousel/bot_2.webp" alt="">
                    </div>
                </div>
                <div class="col-lg-2 rightmenubanner" style="width: 19.66666667% !important;">
                    <a href="#"><img src="images/right_carousel/right_1.webp" alt=""></a>
                    <a href="#"><img src="images/right_carousel/right_2.webp" alt=""></a>
                    <a href="#"><img src="images/right_carousel/right_3.webp" alt=""></a>
                </div>
            </div>
        </div>
        <div class="col-lg-2" style="width: 11% !important;"><a href="#"><img class="img-right" src="images/banner-right.png" alt=""></a></div>
    </div>
</div>