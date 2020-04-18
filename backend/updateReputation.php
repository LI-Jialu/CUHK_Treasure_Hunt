<?php
  
    // called from manageTransactions.php
    
    
    $rating = $_POST['rating'];
    $user_id = $_POST['user_id']; // user id of the user rated
    
    $sql = "SELECT reputation FROM users WHERE user_id = {$user_id};";
    
    $result = $con->query($sql);
    
    $reputation = $result->fetch_assoc()['reputation'];
    
    if ($reputation == -1){ // first time complete tranaction
        $reputation = $rating;
    }
    else {
        
        // get number of existing completed transactions
        $sql = "SELECT NULL FROM transactions WHERE (seller_id = {$user_id} OR buyer_id = {$user_id}) AND status_s = 1 AND status_b = 1;";
        
        $result = $con->query($sql);
        
        $n = $result->num_rows;
        
        // calculate new reputation
        $reputation = ($reputation * $n + $rating) / ($n + 1);
        
    }
?>
