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
