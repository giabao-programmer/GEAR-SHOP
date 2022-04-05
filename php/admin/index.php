<?php

session_start();

include("includes/db.php");

if(!isset($_SESSION['admin_email'])){

echo "<script>window.open('login.php','_self')</script>";

}

else {




?>

<?php

$admin_session = $_SESSION['admin_email'];

$get_admin = "select * from admin  where admin_email='$admin_session'";

$run_admin = mysqli_query($con,$get_admin);

$row_admin = mysqli_fetch_array($run_admin);

$admin_id = $row_admin['admin_id'];

$admin_name = $row_admin['admin_name'];

$admin_email = $row_admin['admin_email'];


$get_products = "SELECT * FROM product";
$run_products = mysqli_query($con,$get_products);
$count_products = mysqli_num_rows($run_products);



// $get_total_orders = "SELECT * FROM order";
// $run_total_orders = mysqli_query($con,$get_total_orders);
// $count_total_orders = mysqli_num_rows($run_total_orders);


// $get_pending_orders = "SELECT * FROM order WHERE orderStatus='pending'";
// $run_pending_orders = mysqli_query($con,$get_pending_orders);
// $count_pending_orders = mysqli_num_rows($run_pending_orders);

// $get_completed_orders = "SELECT * FROM order WHERE orderStatus='Complete'";
// $run_completed_orders = mysqli_query($con,$get_completed_orders);
// $count_completed_orders = mysqli_num_rows($run_completed_orders);


// $get_total_earnings = "SELECT SUM(quantity) as Total FROM order WHERE orderStatus = 'Complete'";
// $run_total_earnings = mysqli_query($con, $get_total_earnings);
// $row = mysqli_fetch_assoc($run_total_earnings);                       
// $count_total_earnings = $row['Total'];



?>


<!DOCTYPE html>
<html>

<head>

<title>Admin Panel</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" >
<link rel="shortcut icon" href="//cdn.shopify.com/s/files/1/2484/9148/files/SDQSDSQ_32x32.png?v=1511436147" type="image/png">

</head>

<body>

<div id="wrapper"><!-- wrapper Starts -->

<?php include("includes/sidebar.php");  ?>

<div id="page-wrapper"><!-- page-wrapper Starts -->

<div class="container-fluid"><!-- container-fluid Starts -->

<?php

if(isset($_GET['dashboard'])){

include("dashboard.php");

}

if(isset($_GET['insert_product'])){

include("insert_product.php");

}

if(isset($_GET['view_products'])){

include("view_products.php");

}

if(isset($_GET['delete_product'])){

include("delete_product.php");

}

if(isset($_GET['edit_product'])){

include("edit_product.php");

}

if(isset($_GET['insert_cat'])){

include("insert_cat.php");

}

if(isset($_GET['view_cats'])){

include("view_cats.php");

}

if(isset($_GET['delete_cat'])){

include("delete_cat.php");

}

if(isset($_GET['edit_cat'])){

include("edit_cat.php");

}

if(isset($_GET['view_customers'])){

include("view_customers.php");
    
}

if(isset($_GET['customer_delete'])){

include("customer_delete.php");
        
}


if(isset($_GET['view_orders'])){

include("view_orders.php");

}
if(isset($_GET['view_orderdetail'])){

    include("view_orderdetail.php");
        
    }
if(isset($_GET['order_delete'])){

include("order_delete.php");

}


if(isset($_GET['view_payments'])){

include("view_payments.php");

}

if(isset($_GET['payment_delete'])){

include("payment_delete.php");

}

if(isset($_GET['insert_user'])){

include("insert_user.php");

}

if(isset($_GET['view_users'])){

include("view_users.php");

}


if(isset($_GET['user_delete'])){

include("user_delete.php");

}



if(isset($_GET['user_profile'])){

include("user_profile.php");

}


if(isset($_GET['insert_brands'])){

include("insert_brands.php");

}

if(isset($_GET['view_brands'])){

include("view_brands.php");

}

if(isset($_GET['delete_brands'])){

include("delete_brands.php");

}

if(isset($_GET['edit_brands'])){

include("edit_brands.php");

}

?>

</div><!-- container-fluid Ends -->

</div><!-- page-wrapper Ends -->

</div><!-- wrapper Ends -->

<script src="js/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>


</body>


</html>

<?php } ?>