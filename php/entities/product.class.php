<?php
    class Product
    {
        public $productId;
        public $productName;
        public $categoryId;
        public $brandId ;
        public $quantity;
        public $price;
        public $description;
        public $image;

        public function __construct($pro_id,$pro_Name,$cate_id,$brand_Id,$quantity,$price,$desc,$image)
        {
            $this -> productId = $pro_id;
            $this -> productName = $pro_Name;
            $this -> categoryId = $cate_id;
            $this -> brandId = $brand_Id;
            $this -> quantity = $quantity;
            $this -> price = $price;
  
            $this -> description = $desc;
            $this -> image = $image;
            
        }

        public static function list_prod()
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM product WHERE hot = 1 LIMIT 8";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }

        public function save()
        {
            # code...
            $file_temp = $this->image['tmp_name'];
            $user_file = $this->image['name'];
            $timestamp = date("Y").date("m").date("d").date("h").date("i").date("s");
            $filepath = "uploads/".$timestamp.$user_file;
            if (move_uploaded_file($file_temp,$filepath)==false) {

                # code...
                return false;
            }
            
            $db = new db();

            $sql = "INSERT INTO product (productName,categoryId,brandId,quantity,price,description,image) VALUES ('$this->productName','$this->categoryId','$this->brandId','$this->quantity','$this->price','$this->description', '$filepath')";

            $resul = $db-> query_execute($sql);
            return $resul;
        }

        public static function list_product_by_cateid($cateid)
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM product WHERE categoryId = '$cateid' ORDER BY price";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
        public static function list_product_by_cateid_desc($cateid)
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM product WHERE categoryId = '$cateid' ORDER BY price DESC";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
        public static function list_product_relate($cateid, $id)
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM product WHERE categoryId = '$cateid' AND productId != '$id'";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }

        public static function get_product($p_id)
        {
            # code...
            
            $db = new db();

            $sql = "SELECT * FROM product WHERE productId = '$p_id'";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
        
        public static function list_product_by_name($search)
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM product WHERE productName like '%$search%' ORDER BY price";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
    }
    
?>