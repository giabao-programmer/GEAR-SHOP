<?php



if (!isset($_SESSION['admin_email'])) {

    echo "<script>window.open('login.php','_self')</script>";
} else {

?>


    <div class="row">
        <!--  1 row Starts -->

        <div class="col-lg-12">
            <!-- col-lg-12 Starts -->

            <ol class="breadcrumb">
                <!-- breadcrumb Starts -->

                <li class="active">

                    <i class="fa fa-dashboard"></i> Dashboard / View Products

                </li>

            </ol><!-- breadcrumb Ends -->

        </div><!-- col-lg-12 Ends -->

    </div><!--  1 row Ends -->

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

                        <i class="fa fa-money fa-fw"></i> View Products

                    </h3><!-- panel-title Ends -->


                </div><!-- panel-heading Ends -->

                <div class="panel-body">
                    <!-- panel-body Starts -->

                    <div class="table-responsive">
                        <!-- table-responsive Starts -->

                        <table class="table table-bordered table-hover table-striped">
                            <!-- table table-bordered table-hover table-striped Starts -->

                            <thead>

                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Hot</th>
                                    <th>Quantity</th>
                                    <th>Instock</th>
                                    <th>Delete</th>
                                    <th>Edit</th>
                                </tr>

                            </thead>

                            <tbody>

                                <?php

                                $i = 0;

                                $get_pro = "select * from product";

                                $run_pro = mysqli_query($con, $get_pro);

                                while ($row_pro = mysqli_fetch_array($run_pro)) {

                                    $pro_id = $row_pro['productId'];

                                    $pro_name = $row_pro['productName'];

                                    $pro_image = $row_pro['image'];

                                    $pro_price = $row_pro['price'];

                                    $pro_qty = $row_pro['quantity'];

                                    $pro_instock = $row_pro['instock'];
                                    $pro_hot = $row_pro['hot'];
                                    $i++;

                                ?>

                                    <tr>

                                        <td><?php echo $i; ?></td>

                                        <td><?php echo $pro_name; ?></td>

                                        <td><img src="../uploads/<?php echo $pro_image; ?>" width="60" height="60"></td>

                                        <td>$ <?php echo $pro_price; ?></td>

                                        <td>
                                            <?php
                                            echo $pro_hot;
                                            ?>
                                        </td>

                                        <td> <?php echo $pro_qty; ?> </td>

                                        <!-- <td><?php echo $pro_instock; ?></td> -->

                                        <td>
                                            <?php

                                            if ($pro_instock == 0) {

                                                echo $pro_instock = '<div style="color:red;">Out of stock</div>';
                                            } else {

                                                echo $pro_instock = 'Stocking';
                                            }


                                            ?>
                                        </td>

                                        <td>

                                            <a href="index.php?delete_product=<?php echo $pro_id; ?>">

                                                <i class="fa fa-trash-o"> </i> Delete

                                            </a>

                                        </td>

                                        <td>

                                            <a href="index.php?edit_product=<?php echo $pro_id; ?>">

                                                <i class="fa fa-pencil"> </i> Edit

                                            </a>

                                        </td>

                                    </tr>

                                <?php } ?>


                            </tbody>


                        </table><!-- table table-bordered table-hover table-striped Ends -->

                    </div><!-- table-responsive Ends -->

                </div><!-- panel-body Ends -->

            </div><!-- panel panel-default Ends -->

        </div><!-- col-lg-12 Ends -->

    </div><!-- 2 row Ends -->




<?php } ?>