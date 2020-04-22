<?php

    //sample: Database.get("/data/filter.php","?tag=medical use&items=1,2,8");
    // for filtering the results of search.php using tags
    // used after search.php, search returns item_id, which can be used here
    
    require_once('connectDB.php');
    
    $tag = $_GET['tag'];
    $items = $_GET['items']; // a string of item_ids joined by a comma, e.g. 1,2,3,7
    
    $sql = "SELECT *
    FROM items i
    JOIN item_tags it
        USING (item_id)
    JOIN tags t
        USING (tag_id)
    WHERE i.item_id IN ({$items}) AND t.tag = '{$tag}';";
    
    require_once('echo.php');
?>
