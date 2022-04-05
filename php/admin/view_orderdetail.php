<?php


if (!isset($_SESSION['admin_email'])) {


    echo "<script>window.open('login.php','_self')</script>";
} else {


?>

    <div class="row">
        <!-- 1 row Starts -->

        <div class="col-lg-12">
            <!-- col-lg-12 Starts -->

            <ol class="breadcrumb">
                <!-- breadcrumb Starts  --->

                <li class="active">

                    <i class="fa fa-dashboard"></i> Dashboard / View Orders

                </li>

            </ol><!-- breadcrumb Ends  --->

        </div><!-- col-lg-12 Ends -->

    </div><!-- 1 row Ends -->


    <div class="row">
        <!-- 2 row Starts -->

        <div class="col-lg-12">
            <!-- col-lg-12 Starts -->

            <div class="panel panel-default">
                <!-- panel panel-default Starts -->

                <div class="panel-heading">
                    <!-- panel-heading Starts -->

                    <h3 class="panel-title">
                        <!-- panel-title Starts -->

                        <i class="fa fa-money fa-fw"></i> View Orders

                    </h3><!-- panel-title Ends -->

                </div><!-- panel-heading Ends -->

                <div class="panel-body">
                    <!-- panel-body Starts -->

                    <div class="table-responsive">
                        <!-- table-responsive Starts -->

                        <table class="table table-bordered table-hover table-striped" style="text-align: center;">
                            <!-- table table-bordered table-hover table-striped Starts -->

                            <thead >
                                <!-- thead Starts -->
                                <tr>
                                    <th style="text-align: center;">Product</th>
                                    <th style="text-align: center;">Unit Price</th>
                                    <th style="text-align: center;">Buy Quantity</th>
                                </tr>

                            </thead><!-- thead Ends -->
                            <tbody>
                                <!-- tbody Starts -->
                                <?php
                                if (isset($_GET['view_orderdetail'])) {
                                    $oid = $_GET['view_orderdetail'];
                                    $get_orderdetails = "select * from orderdetails where orderId = '$oid'";
                                    $run_orderdetails = mysqli_query($con, $get_orderdetails);
                                }
                                while ($row_orderdetails = mysqli_fetch_array($run_orderdetails)) {
                                    $buy_quantity = $row_orderdetails['quantity'];
                                    $product_id = $row_orderdetails['productId'];
                                    $get_products = "select * from product where productId='$product_id'";
                                    $run_products = mysqli_query($con, $get_products);

                                    $row_products = mysqli_fetch_array($run_products);

                                    $product_name = $row_products['productName'];
                                    $product_price = $row_products['price'];
                                ?>
                                    <tr class="details">

                                        <td><?php echo $product_name ?></td>

                                        <td><?php echo $product_price ?> vnđ</td>

                                        <td><?php echo $buy_quantity ?></td>


                                    </tr>

                                <?php } ?>

                            </tbody><!-- tbody Ends -->

                        </table><!-- table table-bordered table-hover table-striped Ends -->

                    </div><!-- table-responsive Ends -->

                </div><!-- panel-body Ends -->

            </div><!-- panel panel-default Ends -->

        </div><!-- col-lg-12 Ends -->

    </div><!-- 2 row Ends -->


<?php } ?>