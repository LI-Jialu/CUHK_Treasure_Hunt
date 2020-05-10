/*
Module to filter out items using tag. Only items containing the tag will remain.

Module Name: Filter
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   tag: items containing this tag will remain, others will be filtered out
   items: the list of items on which to carry out filtering. Pass this parameter as a string of item_ids joined by a comma, e.g. "1,2,3,7"

Output Parameters:
   array of items caontating the tag in json format.
*/
<?php

    //sample: Database.get("/data/filter.php","?tag=medical use&items=1,2,8");
    
    require_once('connectDB.php');
    
    $tag = $_GET['tag'];
    $items = $_GET['items'];
    
    $sql = "SELECT *
    FROM items i
    JOIN item_tags it
        USING (item_id)
    JOIN tags t
        USING (tag_id)
    WHERE i.item_id IN ({$items}) AND t.tag = '{$tag}';";
    
    require_once('echo.php');
?>
