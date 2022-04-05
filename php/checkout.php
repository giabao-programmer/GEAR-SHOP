<?php
include 'inc/header.php';
include 'admin/includes/db.php';
$total_price = 0;
?>
<div class="container body1680px pt-4" style="display: block">
    <div style="text-align: center">
        <h1>Your Info</h1>
    </div>
    <hr />
    <div class="form-horizontal">
        <div class="py-4">
            <div class="container px-4 px-lg-5 my-4">
                <div class="row gx-4 gx-lg-5 align-item-center px-lg-5">
                    <form style="text-align: center" method="POST">
                        <div class="form-group mb-3 checkout">
                            <label for="name">Your Name</label>
                            <input name="cus_name" type="text" class="form-control" placeholder="Enter your full name..." required/>
                        </div>
                        <div class="form-group mb-3 checkout">
                            <label for="phone">Phone number</label>
                            <input name="cus_phone" type="text" class="form-control" placeholder="Your phone number..." required/>
                        </div>
                        <div class="form-group mb-3 checkout">
                            <label for="email">Email</label>
                            <input name="cus_email" type="text" class="form-control" placeholder="Your email..." required/>
                        </div>
                        <div class="form-group mb-3 checkout">
                            <select class="form-control" id="province" name="province" onclick="changeFunc();" required>
                                <option value="" selected>----</option>
                            </select>
                        </div>
                        <div class="form-group mb-3 checkout">
                            <select class="form-control" id="district" name="district" onchange="changeFuncDistrict();" required>
                                <option value="" selected>Quận huyện</option>
                            </select>
                        </div>
                        <div class="form-group mb-3 checkout">
                            <select class="form-control" id="ward" name="ward" aria-placeholder="Quận huyện" onchange="changeFuncWard();" required>
                                <option value="" selected>Phường xã</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="address">Address</label>
                            <input name="address" type="text" class="form-control" style="width: 89%; border-radius: 20px; margin: 0 auto;" placeholder="Your address number ect: 35A Nguyen Thi Minh Khai..." required/>
                        </div>
                        <div class="form-group mb-3 mt-5">
                            <div style="border: 3px solid red; border-radius: 10px; width: 90%; margin: auto;">
                                <table style="width: 100%">
                                    <tbody>
                                        <?php
                                        $sql = "SELECT * FROM product WHERE productId IN (";

                                        foreach ($_SESSION['cart'] as $id => $row) {
                                            $sql .= $id . ",";
                                        }

                                        $sql = substr($sql, 0, -1) . ")";
                                        $query = mysqli_query($con, $sql);
                                        $totalprice = 0;
                                        while ($row = mysqli_fetch_array($query)) {
                                            $subtotal = $_SESSION['cart'][$row['productId']]['quantity'] * $row['price'];
                                            $totalprice += $subtotal;
                                            $pro_qty = $_SESSION['cart'][$row['productId']]['quantity'];
                                        ?>
                                            <tr>

                                                <td><img class="cartimg" src="uploads/<?php echo $row["image"] ?>" alt="" /></td>

                                                <td style="width: 50%;"><?php echo $row['productName'] ?></td>
                                                <td>x<?php echo $_SESSION['cart'][$row['productId']]['quantity']; ?></td>
                                                <td><?php echo $subtotal ?> vnđ</td>
                                            </tr>
                                        <?php
                                        }
                                        ?>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <h2>Payment method</h2>
                        <label class="payment">
                            <input type="radio" checked="checked" name="method" value="COD" />
                            <span class="checkmark"></span>COD
                        </label>
                        <label class="payment">
                            <input type="radio" name="method" value="MOMO" />
                            <span class="checkmark"></span>MOMO
                        </label>

                        <div class="py-5 center">
                            <button type="submit" name="submit" class="btn btn-danger">Confirm order</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
if (isset($_POST['submit'])) {
    function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    function execPostRequest($url, $data)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt(
            $ch,
            CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data)
            )
        );
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        //execute post
        $result = curl_exec($ch);
        //close connection
        curl_close($ch);
        return $result;
    }
    $orderid = generateRandomString();
    function ConfirmOrder($orderid)
    {
        $con = mysqli_connect("localhost", "root", "giabao", "gearshop");
        $cusName = $_POST['cus_name'];
        $cusphone = $_POST['cus_phone'];
        $cusemail = $_POST['cus_email'];
        $address = $_POST['address'];
        $ward = $_POST['ward'];
        $district = $_POST['district'];
        $province = $_POST['province'];
        //add order
        $insert_order = "insert into orders (orderId,cus_name, cus_phone, cus_email,shipAddress, shipProvince, shipDistrict, shipWard) values ('$orderid','$cusName', '$cusphone', '$cusemail', '$address', '$province', '$district', '$ward')";
        $run_order = mysqli_query($con, $insert_order);

        //add orderDetails
        $sql = "SELECT * FROM product WHERE productId IN (";
        foreach ($_SESSION['cart'] as $id => $row) {
            $sql .= $id . ",";
        }
        $sql = substr($sql, 0, -1) . ")";
        $query = mysqli_query($con, $sql);
        $totalprice = 0;
        while ($row = mysqli_fetch_array($query)) {
            $pro_id = $row['productId'];
            $price = $row['price'];
            $pro_qty = $_SESSION['cart'][$row['productId']]['quantity'];
            $insert_orderd = "insert into orderdetails (orderId, productId, unitprice, quantity) values ('$orderid','$pro_id', '$price', '$pro_qty' )";
            $run_orderd = mysqli_query($con, $insert_orderd);
        }
        if ($run_order) {
            echo "<script>alert('Order successfully')</script>";
            echo "<script>window.open('index.php','_self')</script>";
        }
        session_destroy();
    }
    $method = $_POST["method"];
    if ($method == "MOMO") {
        $endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
        $partnerCode = "MOMO5RGX20191128";
        $accessKey = "M8brj9K6E22vXoDB";
        $secretKey = "nqQiVSgDMy809JoPF6OzP5OdBUB550Y4";
        $orderInfo = "Thanh toán qua MoMo";
        $amount = "$totalprice";
        $orderId = "$orderid";
        $returnUrl = "http://localhost:8081/gearshop/result.php";
        $notifyurl = "http://localhost:8081/gearshop/result.php";
        $requestId = time() . "";
        $requestType = "captureMoMoWallet";
        // Lưu ý: link notifyUrl không phải là dạng localhost
        $extraData = "merchantName=MoMo Partner";
        //before sign HMAC SHA256 signature
        $rawHash = "partnerCode=" . $partnerCode . "&accessKey=" . $accessKey . "&requestId=" . $requestId . "&amount=" . $amount . "&orderId=" . $orderId . "&orderInfo=" . $orderInfo . "&returnUrl=" . $returnUrl . "&notifyUrl=" . $notifyurl . "&extraData=" . $extraData;
        $signature = hash_hmac("sha256", $rawHash, $secretKey);
        $data = array(
            'partnerCode' => $partnerCode,
            'accessKey' => $accessKey,
            'requestId' => $requestId,
            'amount' => $amount,
            'orderId' => $orderId,
            'orderInfo' => $orderInfo,
            'returnUrl' => $returnUrl,
            'notifyUrl' => $notifyurl,
            'extraData' => $extraData,
            'requestType' => $requestType,
            'signature' => $signature
        );
        $result = execPostRequest($endpoint, json_encode($data));
        $jsonResult = json_decode($result, true);  // decode json
        header('Location: ' . $jsonResult['payUrl']);
        echo ("<script>location.href = '" . $jsonResult['payUrl'] . "';</script>");
    } elseif ($method == "COD") {
        ConfirmOrder($orderid);
    }
    /* end add orderDetails */
}
?>
<!----------------------------------- End product home ----------------------------------->
<!-- Footer-->
<?php
include 'inc/footer.php';
?>