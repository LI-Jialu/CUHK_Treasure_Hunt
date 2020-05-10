/*
Module to update the reputation of both the buyer and seller upon completion of a transaction.

Module Name: UpdateReputation
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   None

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php

    // called from manageTransactions.php
    
    function updateRep($id, $rating,$con){
        
        // get reputation now
        $sql = "SELECT reputation FROM users WHERE user_id = {$id};";

        $result = $con->query($sql);

        $reputation = $result->fetch_assoc()['reputation'];
        
        // calculate new reputation
        if ($reputation == -1){ // first time complete tranaction
            $reputation = $rating;
        }
        else {
            
            // get number of existing completed transactions
            $sql = "SELECT NULL FROM transactions WHERE (seller_id = {$id} OR buyer_id = {$id}) AND status_s = 1 AND status_b = 1;";
            
            $result = $con->query($sql);
            
            $n = $result->num_rows;
            
            // calculate new reputation
            $reputation = ($reputation * ($n-1) + $rating) / ($n);
            
        }

        // update reputation
        $sql = "UPDATE users SET reputation = {$reputation} WHERE user_id = {$id};";
        require('query.php');
        
    }

    $sql = "SELECT seller_id, buyer_id, rating_s, rating_b FROM transactions WHERE transaction_id = {$transaction_id} AND {$id} = {$user_id}";

    $result = $con->query($sql);
    
    $res = $result->fetch_assoc();
    

    updateRep($res['seller_id'],$res['rating_s'],$con);
    updateRep($res['buyer_id'],$res['rating_b'],$con);

?>
