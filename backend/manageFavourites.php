/*
Module to add/delete a favourite item

Module Name: ManageFavourites
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   action: insert/delete
   item_id: the item_id of the item which you would like to add to/delete from favourites
   favourite_id: for delete only, the favourite_id of the favourited item.

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php

    require_once('connectDB.php');
    require_once('userAuthentication.php');

    $action = $_POST['action'];
    $item_id = $_POST['item_id'];
    $favourite_id = $_POST['favourite_id'];

    $sql;

    if ($action == 'insert'){
        $sql = "INSERT INTO favourites VALUES (DEFAULT, {$item_id}, {$user_id});";
    }
    else if ($action == 'delete'){ // delete either by favourite_id or item_id
        $sql = "DELETE FROM favourites WHERE (favourite_id = '{$favourite_id}' OR item_id = '{$item_id}') AND user_id = {$user_id};";
    }
    
    require_once('query.php');
    
?>
