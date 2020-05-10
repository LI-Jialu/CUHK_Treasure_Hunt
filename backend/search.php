/*
Module to search for items based on a search string

Module Name: Search
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   search: the search string, can contain zero or more characters

Output Parameters:
   items matching the search string in json format.
*/
<?php
    
    // search string is separated into several phrases by space. All items containing any of these phrases will be returned, sorted by recency.
    
    require_once('connectDB.php');
    
    $search = $_GET['search'];

    $search_p = str_replace(' ', '|', $search);
    
    $sql;
    if (empty($search)){
        $sql = "SELECT i.item_id,i.poster_id, i.name, i.price, i.quantity, i.description, i.create_time, i.image,u.reputation FROM items i JOIN users u ON (poster_id = user_id) ORDER BY item_id DESC;";
    }
    else{
        $sql = "SELECT i.item_id,i.poster_id, i.name, i.price, i.quantity, i.description, i.create_time, i.image,u.reputation FROM items i JOIN users u ON (poster_id = user_id) WHERE name REGEXP '{$search}|{$search_p}' ORDER BY item_id DESC;";
    }
    require_once('echo.php');
    
?>
