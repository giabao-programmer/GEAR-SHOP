<?php

    class Category
    {
        public $categoryId;
        public $categoryName;

        public function __construct($cate_Id,$cate_Name)
        {
            $this -> categoryId = $cate_Id;
            $this -> categoryName = $cate_Name;
        }

        public static function list_cate()
        {
            # code...
            $db = new db();

            $sql = "SELECT * FROM category";

            $resul = $db-> select_to_array($sql);
            return $resul;
        }
        public function save_cate()
        {
            # code...
            $db = new db();

            $sql = "INSERT INTO category (categoryId,categoryName) VALUES ('$this -> categoryId','$this->categoryName')";

            $resul = $db-> query_execute($sql);
            return $resul;
        }
    }
    
?>