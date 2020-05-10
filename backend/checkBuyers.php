/*
 Module to find the buyers of an item given the item_id.
 
 Module Name: CheckBuyers
 Programmer: Hon Tik TSE
 Version: 1.0 (10 May 2020)
 
 Input Parameters:
    item_id
 
 Output Parameters:
    array of buyers in json format
 */
<?php
    require_once('connectDB.php');
    
    $item_id = $_GET['item_id'];
    
    $sql = "SELECT buy_request_id,item_id, buyer_id, quantity, username
    FROM buy_requests br JOIN users u ON (br.buyer_id = u.user_id) WHERE item_id = {$item_id};";
    
    require_once('echo.php');
?>
