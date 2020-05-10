/*
Module to login

Module Name: Login
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters: (Processed and Encoded in the app)
   student_id
   password

Output Parameters: (string, not json encoded)
   user_id, if successful login.
   -1, if unsuccessful login.
*/
<?php
    require_once("connectDB.php");

    $student_id = $_SERVER['PHP_AUTH_USER'];
    $password = $_SERVER['PHP_AUTH_PW'];

    $sql = "SELECT user_id, password FROM users WHERE student_id = '{$student_id}';";
    
    $result = $con->query($sql);
    
    $res = $result->fetch_assoc();
    if ($res['password'] == $password){
        echo $res['user_id'];
    }
    else {
        echo -1;
    }

?>

