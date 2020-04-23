<?php
  
    require_once('cors.php');
    
    $name = $_POST['name'];
    $image = base64_decode($_POST['image']);
    $target_dir = "images/";
   
    echo $name;
    file_put_contents($target_dir.$name, $image);
    
?>
