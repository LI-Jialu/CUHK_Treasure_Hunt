<?php
  
    require_once("connectDB.php");
    require_once("userAuthentication.php");

    $action = $_GET['action'];
    $item_id = $_GET['item_id'];
    $quantity = $_GET['quantity'];
    
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
