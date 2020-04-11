<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $action = $_POST['action'];
    
    // insert parameters
    $seller_id = $_POST['seller_id'];
    $buyer_id = $_POST['buyer_id'];
    $item_id = $_POST['item_id'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    
    // update/delete parameters
    $transaction_id = $_POST['transaction_id'];
    $type = $_POST['type']; // is the user buyer or seller? 'buy'/'sell'
    
    
    $sql;
    
    if ($action == 'insert'){
        // called when user creates a transaction
        $sql = "INSERT INTO transactions VALUES (DEFAULT, 0, 0, {$seller_id}, {$buyer_id}, {$item_id}, {$price}, {$quantity}, DEFAULT);";
        
        require_once('query.php');
    }
    else if ($action == 'update'){
        // called when user indicates completion of transaction
        
        $status_type = $type == 'buy'? 'status_b' : 'status_s';
        $id = $type == 'sell'? 'seller_id':'buyer_id';
        
        $sql = "UPDATE transactions SET {$status_type} = 1 WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        require_once('query.php');
        
        /*// trigger reputation recomputation
        $sql = "SELECT status_s+status_b AS sum FROM transactions WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        $result = $con->query($sql);
        
        if ($result->fetch_assoc()['sum'] == 2){ // transaction complete
            require_once('updateReputation.php');
        }*/
        
    }
    else if ($action == 'delete'){
        
        // called when user wants to cancel transaction
        
        $id = $type == 'sell'? 'seller_id':'buyer_id';
        
        $sql = "DELETE FROM transactions WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        require_once('query.php');
        
        // send message to inform the other user of the deletion
        //...
    }
    
?>
