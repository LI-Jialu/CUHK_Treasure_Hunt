<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    $sql = "SELECT i.item_id, f.favourite_id, i.name, u.username AS seller,i.price, i.quantity, i.image,i.create_time FROM favourites f LEFT JOIN items i USING (item_id) LEFT JOIN users u ON i.poster_id = u.user_id WHERE f.user_id ={$user_id} ORDER BY f.favourite_id DESC";

    
    require_once("echo.php");

?>
