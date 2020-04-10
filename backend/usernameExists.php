<?php
  
    require_once("connectDB.php");
    
    $username = $_GET['username'];
    
    $sql = "SELECT * FROM users WHERE username = '{$username}';";
    
    $result = $con->query($sql);
    
    if ($result->num_rows>0){
        echo 'exist';
    }
    else {
        echo 'not exist';
    }
    
?>
