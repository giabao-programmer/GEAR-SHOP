<?php
session_start();
if (empty($_SESSION['cart'])) {
    # code...
    $items_in_cart = 0;
}else{
    $items_in_cart = count($_SESSION['cart']);
}

if (!empty($_GET["action"])) {
    switch ($_GET["action"]) {
        case "remove":
            $id = $_GET['id'];
            unset($_SESSION['cart'][$id]);
            header("location:cart.php");
            break;
        case "update":
            $id = $_GET['id'];
            $type = $_GET['type'];
            if ($type == "increase") {
                $_SESSION['cart'][$id]['quantity']++;
            }
            else if ($type == "decrease") {
                $_SESSION['cart'][$id]['quantity']--;
                if($_SESSION['cart'][$id]['quantity'] == 0){
                    unset($_SESSION['cart'][$id]);
                }
            }
            header("location:cart.php");
            break;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GEARSHOP</title>
    <link href="css/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mystyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-milk">
    <!-- Banner -->
    <div class="gearshop-top-banner" style="background-image: url(images/banner.png)"></div>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-sm navbar-light bg-milk nav-border">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.php"><img src="images/logo.png" alt="" style="width: 50px; height: 50px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" style="margin: 0;">
                    <li class="nav-item"><a class="nav-link active fontbold" aria-current="page" href="#!">Contact</a></li>
                    <li class="nav-item"><a class="nav-link fontbold" href="#!">Youtube</a></li>
                    <li class="nav-item" style="margin-left: 100px">
                        <form action="search.php?" class="form-input" method="get">
                            <input class="ps-3" type="text" name="productname" placeholder="Here to search...">
                            <button type="submit">
                                <img src="images/icon/search.png" alt="">
                            </button>
                        </form>
                    </li>
                </ul>
                <form class="d-flex">
                    <a class="btn btn-outline-dark" type="button" style="border-radius: 1.5rem" href="cart.php">
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill"><?php echo $items_in_cart ?></span>
                    </a>
                </form>
            </div>
        </div>
    </nav>