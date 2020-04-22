<?php
  
    // for checking OTHER USER's profile
    
    require_once('connectDB.php');
    
    $check_id = $_GET['check_id'];
    
    $sql = "SELECT user_id,username,c.college,year,dorm FROM users u JOIN colleges c USING (college_id) WHERE user_id = {$check_id}";
    
    require_once('echo.php');
?>
