/*
Module to add tags to an item

Module Name: PostTags
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   item_id: item_id of the item to which you want to assign tags
   tags: tag_id of the tags you want to assign to the item, joined by comma

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $item_id = $_POST['item_id'];
    $tags = $_POST['tags']; // tags should be the index of tags joined by ','
    // e.g. "tags":"1,2,3,6,7"
    $tags = explode(',',$tags);
    
    foreach($tags as $t){
        $tag = $t + 1;
        $sql = "INSERT INTO item_tags VALUES ({$item_id}, {$tag});";
        require('query.php');
    }
    
?>
