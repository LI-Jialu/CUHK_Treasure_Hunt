/*
Module to retrieve the profile of the user logged in

Module Name: Profile
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   None

Output Parameters:
   Profile of the user in json format
*/
<?php
    
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $sql = "SELECT u.username, u.student_id, c.college, u.year, u.dorm, u.reputation FROM users u JOIN colleges c USING (college_id) WHERE u.user_id = {$user_id};";
    
    require_once("echo.php");
    
?>
