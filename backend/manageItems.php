<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $action = $_GET['action'];
    $name = $_GET['name'];
    $price = $_GET['price'];
    $quantity = $_GET['quantity'];
    
    $sql;
    
    if (action == 'insert'){
        $sql = "INSERT INTO items VALUES (DEFAULT, {$user_id}, {$name}, {$price}, {$quantity}, DEFAULT);";
    }
    else if (action == 'update'){
        
    }
    else if (action == 'delete'){
        
    }
    
?>
