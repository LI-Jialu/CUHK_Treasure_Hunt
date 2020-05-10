/*
Module to retrieve all items posted by the user

Module Name: ItemsPosted
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   None

Output Parameters:
   array of items in json format
*/
<?php

    require_once("connectDB.php");
    require_once("userAuthentication.php");

    // now user is authenticated
    $sql = "SELECT * FROM items WHERE poster_id = '{$user_id}'";
     
    require_once("echo.php");

?>

