/*
Module to create, update or delete buy requests.

Module Name: ManageBuyRequests
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   action: insert, delete or update
   item_id: the item_id of the item on which you want to make/update/delete buy request
   quantity: the quantity you would like to buy

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php
  
    require_once("connectDB.php");
    require_once("userAuthentication.php");

    $action = $_POST['action'];
    $item_id = $_POST['item_id'];
    $quantity = $_POST['quantity'];
    
    $sql;
    
    if ($action == 'insert'){
        $sql = "INSERT INTO buy_requests VALUES (DEFAULT, {$item_id}, {$user_id}, {$quantity});";
    }
    else if ($action == 'delete'){
        $sql = "DELETE FROM buy_requests WHERE item_id = {$item_id} AND buyer_id = {$user_id} AND quantity = {$quantity};";
    }
    else if ($action == 'update'){
        $sql = "UPDATE buy_requests SET quantity = {$quantity} WHERE item_id = {$item_id} AND buyer_id = {$user_id};";
    }
    
    require_once('query.php');
    
?>
