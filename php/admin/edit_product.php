<?php

if (!isset($_SESSION['admin_email'])) {

  echo "<script>window.open('login.php','_self')</script>";
} else {

?>

  <?php

  if (isset($_GET['edit_product'])) {

    $edit_id = $_GET['edit_product'];

    $get_p = "select * from product where productId='$edit_id'";

    $run_edit = mysqli_query($con, $get_p);

    $row_edit = mysqli_fetch_array($run_edit);

    $p_id = $row_edit['productId'];

    $p_name = $row_edit['productName'];

    $cat = $row_edit['categoryId'];

    $m_id = $row_edit['brandId'];

    $p_image1 = $row_edit['image'];

    $new_p_image1 = $row_edit['image'];

    $p_price = $row_edit['price'];

    $p_desc = $row_edit['description'];

    $p_properties = $row_edit['properties'];

    $p_qty = $row_edit['quantity'];

    $p_instock = $row_edit['instock'];

    $p_hot = $row_edit['hot'];
  }

  $get_brand = "select * from brand where brandId='$m_id'";

  $run_brand = mysqli_query($con, $get_brand);

  $row_brand = mysqli_fetch_array($run_brand);

  $brand_id = $row_brand['brandId'];

  $brand_name = $row_brand['brandName'];


  $get_cat = "select * from category where categoryId='$cat'";

  $run_cat = mysqli_query($con, $get_cat);

  $row_cat = mysqli_fetch_array($run_cat);

  $cat_name = $row_cat['categoryName'];

  ?>


  <!DOCTYPE html>

  <html>

  <head>

    <title> Edit Products </title>


    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>
      tinymce.init({
        selector: '#description,#properties'
      });
    </script>

  </head>

  <body>

    <div class="row">
      <!-- row Starts -->

      <div class="col-lg-12">
        <!-- col-lg-12 Starts -->

        <ol class="breadcrumb">
          <!-- breadcrumb Starts -->

          <li class="active">

            <i class="fa fa-dashboard"> </i> Dashboard / Edit Products

          </li>

        </ol><!-- breadcrumb Ends -->

      </div><!-- col-lg-12 Ends -->

    </div><!-- row Ends -->


    <div class="row">
      <!-- 2 row Starts -->

      <div class="col-lg-12">
        <!-- col-lg-12 Starts -->

        <div class="panel panel-default">
          <!-- panel panel-default Starts -->

          <div class="panel-heading">
            <!-- panel-heading Starts -->

            <h3 class="panel-title">

              <i class="fa fa-money fa-fw"></i> Edit Products

            </h3>

          </div><!-- panel-heading Ends -->

          <div class="panel-body">
            <!-- panel-body Starts -->

            <form class="form-horizontal" method="post" enctype="multipart/form-data">
              <!-- form-horizontal Starts -->

              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Product Name </label>

                <div class="col-md-6">

                  <input type="text" name="productName" class="form-control" required value="<?php echo $p_name; ?>">

                </div>

              </div><!-- form-group Ends -->



              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Select A Brand </label>

                <div class="col-md-6">

                  <select name="brand" class="form-control">

                    <option value="<?php $pi = $brand_id;
                                    echo $brand_id; ?>">
                      <?php echo $brand_name; ?>
                    </option>

                    <?php

                    $get_brand = "select * from brand where brandId !=$pi ";

                    $run_brand = mysqli_query($con, $get_brand);

                    while ($row_brand = mysqli_fetch_array($run_brand)) {

                      $brand_id = $row_brand['brandId'];

                      $brand_name = $row_brand['brandName'];

                      echo "
<option value='$brand_id'>
$brand_name
</option>
";
                    }

                    ?>

                  </select>

                </div>
              </div>


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Category </label>

                <div class="col-md-6">


                  <select name="category" class="form-control">

                    <option value="<?php echo $cat; ?>"> <?php echo $cat_name; ?> </option>

                    <?php

                    $get_cat = "select * from category ";

                    $run_cat = mysqli_query($con, $get_cat);

                    while ($row_cat = mysqli_fetch_array($run_cat)) {

                      $cat_id = $row_cat['categoryId'];

                      $cat_name = $row_cat['categoryName'];

                      echo "<option value='$cat_id'>$cat_name</option>";
                    }

                    ?>


                  </select>

                </div>

              </div><!-- form-group Ends -->

              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Product Image </label>

                <div class="col-md-6">

                  <input type="file" name="image" class="form-control">
                  <br><img src="../uploads/<?php echo $p_image1; ?>" width="70" height="70">

                </div>
              </div>


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Product Price </label>

                <div class="col-md-6">

                  <input type="text" name="price" class="form-control" required value="<?php echo $p_price; ?>">

                </div>

              </div><!-- form-group Ends -->


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Quantity </label>

                <div class="col-md-6">

                  <input type="text" name="quantity" class="form-control" required value="<?php echo $p_qty; ?>">

                </div>

              </div><!-- form-group Ends -->


              <div class="form-group">

                <label class="col-md-3 control-label"> Hot product </label>

                <div class="col-md-6">
                  <?php
                  if ($p_hot == 1) {
                    echo '<input type="checkbox" name="hot" class="form-control" value="1" checked>';
                  } else {
                    echo '<input type="checkbox" name="hot" class="form-control" value="0">';
                  }
                  ?>
                  <input type="hidden" name="hot" class="form-control" value="0">

                </div>

              </div>


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Product Tabs </label>

                <div class="col-md-6">

                  <ul class="nav nav-tabs">
                    <!-- nav nav-tabs Starts -->

                    <li class="active">

                      <a data-toggle="tab" href="#description"> Product Description </a>

                    </li>

                    <li>

                      <a data-toggle="tab" href="#properties"> Product Properties </a>

                    </li>

                  </ul><!-- nav nav-tabs Ends -->

                  <div class="tab-content">
                    <!-- tab-content Starts -->

                    <div id="description" class="tab-pane fade in active">
                      <!-- description tab-pane fade in active Starts -->

                      <br>

                      <textarea name="description" class="form-control" rows="15" id="description">

<?php echo $p_desc; ?>

</textarea>

                    </div><!-- description tab-pane fade in active Ends -->


                    <div id="properties" class="tab-pane fade in">
                      <!-- features tab-pane fade in Starts -->

                      <br>

                      <textarea name="properties" class="form-control" rows="15" id="properties">

<?php echo $p_properties; ?>

</textarea>

                    </div><!-- features tab-pane fade in Ends -->



                  </div><!-- tab-content Ends -->

                </div>

              </div><!-- form-group Ends -->


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"></label>

                <div class="col-md-6">

                  <input type="submit" name="update" value="Update Product" class="btn btn-primary form-control">

                </div>

              </div><!-- form-group Ends -->

            </form><!-- form-horizontal Ends -->

          </div><!-- panel-body Ends -->

        </div><!-- panel panel-default Ends -->

      </div><!-- col-lg-12 Ends -->

    </div><!-- 2 row Ends -->




  </body>

  </html>

  <?php

  if (isset($_POST['update'])) {

    $product_name = $_POST['productName'];
    $cat = $_POST['category'];
    $brand_id = $_POST['brand'];
    $product_price = $_POST['price'];
    $product_desc = $_POST['description'];

    $qty = $_POST['quantity'];
    if ($qty > 0) {
      $product_instock = 1;
    } else {
      $product_instock = 0;
    }
   
    if(isset($_POST['hot'])){
      $hot = 1;
    }  else {
      $hot = 0;
    }
    $hotp =  $hot;
    $product_properties = $_POST['properties'];

    $product_img1 = $_FILES['image']['name'];

    $temp_name1 = $_FILES['image']['tmp_name'];

    if (empty($product_img1)) {

      $product_img1 = $new_p_image1;
    }




    move_uploaded_file($temp_name1, "../uploads/$product_img1");

    $update_product = "update product set categoryId='$cat',brandId='$brand_id',productName='$product_name',image='$product_img1',price='$product_price',description='$product_desc',quantity='$qty',instock='$product_instock',properties='$product_properties', hot = '$hotp' where productId='$p_id'";

    $run_product = mysqli_query($con, $update_product);

    if ($run_product) {

      echo "<script> alert('Product has been updated successfully') </script>";

      echo "<script>window.open('index.php?view_products','_self')</script>";
    }
  }

  ?>

<?php } ?>