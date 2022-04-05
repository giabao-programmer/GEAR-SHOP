<?php
    require_once("../config/db.class.php");

    class Brand
    {

        public $brandName;

        public function __construct($brandId,$brandName)
        {
            $this -> brandName = $brandName;
            
        }

        public static function list_brand()
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM brand";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
        public function save_brand()
        {
            # code...
            $db = new db();

            $sql = "INSERT INTO brand (brandName) VALUES ('$this->categoryName')";

            $resul = $db-> query_execute($sql);
            return $resul;
        }
    }
    
?>