<?php



if (!isset($_SESSION['admin_email'])) {

    echo "<script>window.open('login.php','_self')</script>";
} else {

?>

<?php

    if (isset($_GET['order_delete'])) {

        $delete_id = $_GET['order_delete'];

        $delete_order = "delete from orderdetails where orderId='$delete_id'";

        $run_delete = mysqli_query($con, $delete_order);

        $delete_orderd = "delete from orders where orderid='$delete_id'";

        $run_delete = mysqli_query($con, $delete_orderd);

        if ($run_delete) {

            echo "<script>alert('Order Has Been Deleted')</script>";

            echo "<script>window.open('index.php?view_orders','_self')</script>";
        }
    }



?>



<?php }  ?>