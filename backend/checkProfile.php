/*
 Module to view the profile of other users.
 
 Module Name: CheckProfile
 Programmer: Hon Tik TSE
 Version: 1.0 (10 May 2020)
 
 Input Parameters:
    check_id: the user_id of the user whose profile you want to view
 
 Output Parameters:
    the user profile in json format
 */
<?php
  
    // for checking OTHER USER's profile
    
    require_once('connectDB.php');
    
    $check_id = $_GET['check_id'];
    
    $sql = "SELECT user_id,username,c.college,year,dorm FROM users u JOIN colleges c USING (college_id) WHERE user_id = {$check_id}";
    
    require_once('echo.php');
?>
