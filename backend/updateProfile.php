/*
Module to update the profile of the user logged in.

Module Name: UpdateProfile
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters: (must be passed even if no change)
   college: new/existing college
   year: new/existing year
   dorm: new/existing dorm

Output Parameters: (string, not json encoded)
   success/fail
*/
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
