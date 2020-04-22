<?php
    
    // the complete url for the image: Item.imagePath + item['image']
    // flutter can easily render an image based on the url
    
    require_once('connectDB.php');
    //require_once('userAuthentication.php');
    
    $search = $_GET['search'];
    //$filter = $_GET['filter'];

    $search_p = str_replace(' ', '|', $search);
    
    $sql;
    if (empty($search)){
        $sql = "SELECT i.item_id,i.poster_id, i.name, i.price, i.quantity, i.description, i.create_time, i.image,u.reputation FROM items i JOIN users u ON (poster_id = user_id) ORDER BY item_id DESC;";
    }
    else{
        $sql = "SELECT i.item_id,i.poster_id, i.name, i.price, i.quantity, i.description, i.create_time, i.image,u.reputation FROM items i JOIN users u ON (poster_id = user_id) WHERE name REGEXP '{$search}|{$search_p}' ORDER BY item_id DESC;";
    }
    require_once('echo.php');
    
?>
