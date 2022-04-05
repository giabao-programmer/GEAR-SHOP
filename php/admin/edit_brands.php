<?php


if(!isset($_SESSION['admin_email'])){

echo "<script>window.open('login.php','_self')</script>";

}

else {


?>

<?php

if(isset($_GET['edit_brands'])){

$edit_brand = $_GET['edit_brands'];

$get_brand = "select * from brand where brandId='$edit_brand'";

$run_brand = mysqli_query($con,$get_brand);

$row_brand = mysqli_fetch_array($run_brand);

$m_id = $row_brand['brandId'];

$m_name = $row_brand['brandName'];





}


?>

<div class="row"><!-- 1 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<ol class="breadcrumb"><!-- breadcrumb Starts -->

<li class="active">

<i class="fa fa-dashboard"></i> Dashboard / Edit brand

</li>

</ol><!-- breadcrumb Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 1 row Ends -->


<div class="row"><!-- 2 row Starts -->

<div class="col-lg-12"><!-- col-lg-12 Starts -->

<div class="panel panel-default"><!-- panel panel-default Starts -->

<div class="panel-heading"><!-- panel-heading Starts -->

<h3 class="panel-title"><!-- panel-title Starts -->

<i class="fa fa-money fa-fw"> </i> Edit brand

</h3><!-- panel-title Ends -->

</div><!-- panel-heading Ends -->

<div class="panel-body"><!-- panel-body Starts -->

<form class="form-horizontal" action="" method="post" enctype="multipart/form-data"><!-- form-horizontal Starts -->

<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> Brand Name </label>

<div class="col-md-6">

<input type="text" name="brandName" class="form-control" value="<?php echo $m_name; ?>">

</div>

</div><!-- form-group Ends -->



<div class="form-group"><!-- form-group Starts -->

<label class="col-md-3 control-label"> </label>

<div class="col-md-6">

<input type="submit" name="update" class="form-control btn btn-primary" value=" Update Brand " >

</div>

</div><!-- form-group Ends -->

</form><!-- form-horizontal Ends -->

</div><!-- panel-body Ends -->

</div><!-- panel panel-default Ends -->

</div><!-- col-lg-12 Ends -->

</div><!-- 2 row Ends -->

<?php

if(isset($_POST['update'])){

$brand_name = $_POST['brandName'];

$update_brand = "update brand set brandName='$brand_name' where brandId='$m_id'";

$run_brand = mysqli_query($con,$update_brand);

if($run_brand){

echo "<script>alert('Brand Has Been Updated')</script>";

echo "<script>window.open('index.php?view_brands','_self')</script>";

}

}

?>

<?php } ?>