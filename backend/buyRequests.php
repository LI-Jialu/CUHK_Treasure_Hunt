/*
 Module to find the buy requests made by the user logged in.
 
 Module Name: BuyRequests
 Programmer: Hon Tik TSE
 Version: 1.0 (10 May 2020)
 
 Input Parameters:
    None
 
 Output Parameters:
    array of buyRequests in json format
 */
<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");
    
     
    $sql = "SELECT i.name, u.username AS seller, item_id, i.price, b.quantity, i.create_time FROM buy_requests b LEFT JOIN items i USING (item_id) LEFT JOIN users u ON i.poster_id = u.user_id WHERE b.buyer_id = {$user_id} ORDER BY b.buy_request_id DESC";
    
    require_once("echo.php");

?>
