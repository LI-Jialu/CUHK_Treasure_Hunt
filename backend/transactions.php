<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    $type = $_GET["type"]; // received "sell" or "buy"
    $status = $_GET["status"];
    if (type === null || $status === null){
        echo "fail";
        die();
    }
    
    $id = $type == "sell"? "seller_id":"buyer_id";
    
     
    $sql = "SELECT u1.username AS seller, u2.username AS buyer, i.name,t.price, t.quantity, t.create_time FROM transactions t JOIN items i USING (item_id) JOIN users u1 ON t.seller_id = u1.user_id JOIN users u2 ON t.buyer_id = u2.user_id WHERE t.{$id} = {$user_id} AND t.status = {$status} ORDER BY t.create_time DESC";
    
    require_once("echo.php");

?>


