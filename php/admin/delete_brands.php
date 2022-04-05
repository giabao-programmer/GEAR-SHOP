<?php


if(!isset($_SESSION['admin_email'])){

echo "<script>window.open('login.php','_self')</script>";

}

else {


?>

<?php

if(isset($_GET['delete_brands'])){

$delete_id = $_GET['delete_brands'];

$delete_brand = "delete from brand where brandId='$delete_id'";

$run_brand = mysqli_query($con,$delete_brand);

if($run_brand){

echo "<script>alert('One brand Has Been Deleted')</script>";
echo "<script>window.open('index.php?view_brands','_self')</script>";

}

}


?>


<?php } ?>