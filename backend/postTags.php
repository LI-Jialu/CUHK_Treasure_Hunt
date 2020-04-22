<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $item_id = $_POST['item_id'];
    $tags = $_POST['tags']; // tags should be the index of tags joined by ,
    // e.g. "tags":"1,2,3,6,7"
    $tags = explode(',',$tags);
    
    foreach($tags as $t){
        $tag = $t + 1;
        $sql = "INSERT INTO item_tags VALUES ({$item_id}, {$tag});";
        require('query.php');
    }
    
?>
