<?php

    // need to add filter
    // need to add tag search
    
    // the complete url for the image: Item.imagePath + item['image']
    // flutter can easily render an image based on the url
    
    require_once('connectDB.php');
    //require_once('userAuthentication.php');
    
    $search = $_GET['search'];
    //$filter = $_GET['filter'];

    $search_p = str_replace(' ', '|', $search);
    
    $sql;
    if (empty($search)){
        $sql = "SELECT * FROM items";
    }
    else{
        $sql = "SELECT * FROM items WHERE name REGEXP '{$search}|{$search_p}';";
    }
    require_once('echo.php');
    
?>

