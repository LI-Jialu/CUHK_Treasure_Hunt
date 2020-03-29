<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    // now user is authenticated
    $sql = "SELECT * FROM items WHERE poster_id = '{$user_id}'";
     
    require_once("echo.php");

?>

