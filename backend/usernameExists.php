/*
Module to find out whether the username already exists, used during registration.

Module Name: UsernameExists
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   username: the username to be tested

Output Parameters: (string, not json encoded)
   exist/not exist
*/
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
