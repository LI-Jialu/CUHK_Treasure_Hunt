/*
Module to retrieve the transactions the user logged in is involved in.

Module Name:
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   type: 'buy'/'sell'. If 'buy' is passed, transactions in which the user logged in will is the buyer will be returned. Similar for 'sell'.
   status: '1'/'0'. If 1 is passed, completed transactions will be returned. If 0 is passed, transactions that are still in progress will be returned.

Output Parameters:
   array of transactions in json format.
*/
<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    $type = $_GET["type"]; // received "sell" or "buy"
    $status = $_GET["status"]; // 1 for history, 0 for transactions
    if (type === null || $status === null){
        echo "fail";
        die();
    }
    
    $id = $type == "sell"? "seller_id":"buyer_id";
    $condition;
    if ($status == '0'){ // transactions in progress
        $condition = "t.status_s + t.status_b < 2";
    }
    else { // $status == '1', history
        $condition = "t.status_s = 1 AND t.status_b = 1";
    }
    
     
    $sql = "SELECT u1.username AS seller, u2.username AS buyer, i.name,t.price, t.quantity, t.transaction_id,t.status_s,t.status_b,t.create_time,i.image FROM transactions t JOIN items i USING (item_id) JOIN users u1 ON t.seller_id = u1.user_id JOIN users u2 ON t.buyer_id = u2.user_id WHERE t.{$id} = {$user_id} AND {$condition} ORDER BY t.create_time DESC";
    
    require_once("echo.php");

?>
