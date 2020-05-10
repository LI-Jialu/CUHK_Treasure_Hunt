/*
Module to retrieve the tags of an item

Module Name: Tags
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   item_id: item_id of the item of which you want to know the tags

Output Parameters:
   array of tags in json format. e.g. ["free","stationery"]
*/
<?php

    // sample: Database.get("/data/tags.php","?item_id=4");
    // return the tags of an item given the item_id
    // return the tags as a json encoded list
    // like this: ['free','stationery']
    
    require_once('connectDB.php');
    
    $item_id = $_GET['item_id'];
    
    $sql = "SELECT tag FROM items i
    JOIN item_tags it
        USING (item_id)
    JOIN tags t
        USING (tag_id)
    WHERE item_id = {$item_id};";
    
    $result = $con->query($sql);
    $rows = array();
    while ($r = $result->fetch_assoc()){
        $rows[] = $r['tag'];
    }
    echo json_encode($rows);
?>
