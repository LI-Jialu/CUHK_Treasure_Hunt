<?php
  
    // don't allow changeing username
    // can add self description later
    
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $college = $_POST['college'];
    $year = $_POST['year'];
    $dorm = $_POST['dorm'];
    
    require_once('getCollegeID.php');
    
    $sql = "UPDATE users SET college_id = {$college_id}, year = {$year}, dorm = '{$dorm}' WHERE user_id = {$user_id};";
    
    require_once('query.php');
    
?>
