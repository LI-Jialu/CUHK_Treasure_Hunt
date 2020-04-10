<?php
    
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $sql = "SELECT u.username, u.student_id, c.college, u.year, u.dorm, u.reputation FROM users u JOIN colleges c USING (college_id) WHERE u.user_id = {$user_id};";
    
    require_once("echo.php");
    
?>
