/*
Module for user registration

Module Name: Register
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   student_id, password: Processed and encoded in the app
   username
   college
   year
   dorm

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php

    require_once("connectDB.php");

    $student_id = $_SERVER["PHP_AUTH_USER"];
    $password = $_SERVER["PHP_AUTH_PW"];

    $username = $_POST["username"];
    $college = $_POST["college"];
    $year = $_POST["year"];
    $dorm = $_POST["dorm"];

    
    $sql = "INSERT INTO users VALUES (DEFAULT,'{$username}','{$student_id}','{$password}',(SELECT college_id FROM colleges WHERE college = '{$college}'),{$year},'{$dorm}',DEFAULT)";
    
    require_once("query.php");
    

?>
