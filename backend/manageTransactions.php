/*
Module to create/update/delete a transaction

Module Name: ManageTransactions
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   insert parameters
       seller_id: user_id of the seller if the item involved in the transaction
       buyer_id: user_id of the buyer
       item_id: item_id of the item involved
       price: price of the item
       quanitity: quantity of the item sold
   update/delete parameters
       transaction_id: for update/delete only. the transaction_id of the transaction
       type: 'b'/'s', depending on whether the user logged in is the buyer or the seller
   update parameters
       rating: the rating of the other user involved in this transaction rated by the user logged in

Output Parameters: (string, not json encoded)
   success/fail
*/
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
    $type = $_POST['type']; // is the user buyer or seller? 'b'/'s', where 'b' for buy and 's' for sell
    
    // update parameter
    $rating  = $_POST['rating'];
    
    $sql;
    
    if ($action == 'insert'){
        // called when user creates a transaction
        $sql = "INSERT INTO transactions VALUES (DEFAULT, 0, 0, {$seller_id}, {$buyer_id}, DEFAULT, DEFAULT,{$item_id}, {$price}, {$quantity}, DEFAULT);";

        require_once('query.php');
    }
    else if ($action == 'update'){
        // called when user indicates completion of transaction
        
        $id = $type == 's'? 'seller_id':'buyer_id';
        $rating_type = $type == 's'? 'b':'s';
        
        $sql = "UPDATE transactions SET status_{$type} = 1, rating_{$rating_type} = {$rating} WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        require_once('query.php');
        
        // trigger reputation recomputation
        $sql = "SELECT status_s+status_b AS sum FROM transactions WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        $result = $con->query($sql);
        
        if ($result->fetch_assoc()['sum'] == 2){ // transaction complete
            // update reputation of both users
            require_once('updateReputation.php');
        }
        
    }
    else if ($action == 'delete'){
        
        // called when user wants to cancel transaction
        
        $id = $type == 's'? 'seller_id':'buyer_id';
        
        $sql = "DELETE FROM transactions WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id};";
        
        require_once('query.php');
        
        // send message to inform the other user of the deletion
        // to be implemented as an improvement in user experience
    }
    
?>
