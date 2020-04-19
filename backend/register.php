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
