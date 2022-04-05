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

                        <table class="table table-bordered table-hover table-striped">
                            <!-- table table-bordered table-hover table-striped Starts -->

                            <thead>
                                <!-- thead Starts -->
                                <tr>
                                    <th>Id</th>
                                    <th>Customer</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Date</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>

                            </thead><!-- thead Ends -->
                            <tbody>
                                <!-- tbody Starts -->
                                <?php
                                $i = 0;
                                $get_orders = "select * from orders";
                                $run_orders = mysqli_query($con, $get_orders);
                                while ($row_orders = mysqli_fetch_array($run_orders)) {
                                    $o_id = $row_orders['orderId'];
                                    $o_name = $row_orders['cus_name'];
                                    $o_email = $row_orders['cus_email'];
                                    $o_phone = $row_orders['cus_phone'];
                                    $o_date = $row_orders['orderDate'];
                                    $o_address = $row_orders['shipAddress'];
                                    $o_prov = $row_orders['shipProvince'];
                                    $o_dist = $row_orders['shipDistrict'];
                                    $o_ward = $row_orders['shipWard'];
                                    $o_fAddress = "$o_address" . ',' . "$o_ward" . ' ,' . "$o_dist" . ' ,' . "$o_prov";
                                ?>
                                    <tr class="details">

                                        <td bgcolor="orange"><a href="index.php?view_orderdetail=<?php echo $o_id ?>"><?php echo $o_id; ?></a></td>

                                        <td><?php echo $o_name; ?></td>

                                        <td><?php echo $o_email; ?></td>
                                        <td><?php echo $o_phone; ?></td>
                                        <td><?php echo $o_date; ?></td>
                                        <td><?php echo $o_fAddress; ?></td>
                                        <td>
                                            <a href="index.php?order_delete=<?php echo $o_id; ?>">
                                                <i class="fa fa-trash-o"></i> Delete
                                            </a>
                                        </td>


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