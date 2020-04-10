<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');

    $action = $_POST['action'];
    $item_id = $_POST['item_id'];
    $name = $_POST['name'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];

    $sql;
    
    if ($action == 'insert'){
        $sql = "INSERT INTO items VALUES (DEFAULT, {$user_id}, '{$name}', {$price}, {$quantity}, DEFAULT);";
    }
    else if ($action == 'update'){
        $sql = "UPDATE items SET name = '{$name}',price = {$price},quantity = {$quantity} WHERE item_id = {$item_id} AND poster_id = {$user_id};";
    }
    else if ($action == 'delete'){
        $sql = "DELETE FROM items WHERE item_id = {$item_id} AND poster_id = {$user_id};";
    }
    
    require_once('query.php');

?>
