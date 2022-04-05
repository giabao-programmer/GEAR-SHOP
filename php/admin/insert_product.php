<?php

if (!isset($_SESSION['admin_email'])) {

  echo "<script>window.open('login.php','_self')</script>";
} else {

?>
  <!DOCTYPE html>

  <html>

  <head>

    <title> Insert Products </title>


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

            <i class="fa fa-dashboard"> </i> Dashboard / Insert Products

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

              <i class="fa fa-money fa-fw"></i> Insert Products

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

                  <input type="text" name="productName" class="form-control" required>

                </div>

              </div><!-- form-group Ends -->


              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Brand </label>

                <div class="col-md-6">

                  <select class="form-control" name="brand">
                    <!-- select manufacturer Starts -->

                    <option> Select A Brand </option>

                    <?php

                    $get_brand = "select * from brand";
                    $run_brand = mysqli_query($con, $get_brand);
                    while ($row_brand = mysqli_fetch_array($run_brand)) {
                      $brand_id = $row_brand['brandId'];
                      $brand_name = $row_brand['brandName'];

                      echo "<option value='$brand_id'>$brand_name</option>";
                    }

                    ?>

                  </select><!-- select manufacturer Ends -->

                </div>

              </div><!-- form-group Ends -->



              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Category </label>

                <div class="col-md-6">


                  <select name="category" class="form-control">

                    <option> Select a Category </option>

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

                </div>
              </div>



              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Price </label>

                <div class="col-md-6">

                  <input type="text" name="price" class="form-control" required>

                </div>

              </div><!-- form-group Ends -->


              <!-- form-group Starts -->
              <div class="form-group">

                <label class="col-md-3 control-label"> Quantity </label>

                <div class="col-md-6">

                  <input type="text" name="quantity" class="form-control" required>

                </div>

              </div>
              <!-- form-group Starts -->
              <div class="form-group">

                <label class="col-md-3 control-label"> Hot product </label>

                <div class="col-md-6">

                  <input type="hidden" name="hot" class="form-control" value="0">
                  <input type="checkbox" name="hot" class="form-control" value="1">

                </div>

              </div>
              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"> Product Tabs </label>

                <div class="col-md-6">

                  <ul class="nav nav-tabs">
                    <!-- nav nav-tabs Starts -->

                    <li class="active">

                      <a data-toggle="tab" href="#description"> Description </a>

                    </li>

                    <li>

                      <a data-toggle="tab" href="#properties"> Properties </a>

                    </li>


                  </ul><!-- nav nav-tabs Ends -->

                  <div class="tab-content">
                    <!-- tab-content Starts -->

                    <div id="description" class="tab-pane fade in active">
                      <!-- description tab-pane fade in active Starts -->

                      <br>

                      <textarea name="description" class="form-control" rows="15" id="description">


</textarea>

                    </div><!-- description tab-pane fade in active Ends -->


                    <div id="properties" class="tab-pane fade in">
                      <!-- features tab-pane fade in Starts -->

                      <br>

                      <textarea name="properties" class="form-control" rows="15" id="properties">


</textarea>

                    </div><!-- features tab-pane fade in Ends -->

                  </div><!-- tab-content Ends -->

                </div>

              </div><!-- form-group Ends -->


              <!-- form-group Starts -->
              <!-- <div class="form-group" >

<label class="col-md-3 control-label" > Product Label </label>

<div class="col-md-6" >

<input type="text" name="product_label" class="form-control" required >

</div>

</div> -->
              <!-- form-group Ends -->

              <div class="form-group">
                <!-- form-group Starts -->

                <label class="col-md-3 control-label"></label>

                <div class="col-md-6">

                  <input type="submit" name="submit" value="Insert Product" class="btn btn-primary form-control">

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

  if (isset($_POST['submit'])) {

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
    $hot = $_POST['hot'];
    $product_properties = $_POST['properties'];

    $product_img1 = $_FILES['image']['name'];

    $temp_name1 = $_FILES['image']['tmp_name'];

    move_uploaded_file($temp_name1, "../uploads/$product_img1");


    $insert_product = "insert into product (categoryId,brandId,productName,image,price,quantity,instock,description,properties, hot) values ('$cat','$brand_id','$product_name','$product_img1','$product_price','$qty','$product_instock','$product_desc','$product_properties', '$hot')";

    $run_product = mysqli_query($con, $insert_product);

    if ($run_product) {

      echo "<script>alert('Product has been inserted successfully')</script>";

      echo "<script>window.open('index.php?view_products','_self')</script>";
    }
  }

  ?>

<?php } ?>