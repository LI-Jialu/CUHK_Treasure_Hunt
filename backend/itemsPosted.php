<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    // now user is authenticated
    $sql = "SELECT * FROM items WHERE poster_id = '{$user_id}'";
     
     $result = $con->query($sql);

     $rows = array();

     while ($r = $result->fetch_assoc()){
         $rows[] = $r;
     }

     echo json_encode($rows);

    
?>

