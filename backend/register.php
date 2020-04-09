<?php

    require_once("connectDB.php");


    $username = $_GET["username"];
    $student_id = $_GET["student_id"];
    $password = $_GET["password"];
    $college = $_GET["college"];
    $year = $_GET["year"];
    $dorm = $_GET["dorm"];

    // get college_id
    $sql = "SELECT * FROM colleges WHERE college = {$college};";

    $result = $con->query($sql);

    $college_id = 10;
    
    if ($result->num_rows > 0){
        $college_id = $result->fetch_assoc()['college_id'];
    }
    
    $sql = "INSERT INTO users VALUES (DEFAULT,'{$username}','{$student_id}','{$password}',{$college_id},{$year},'{$dorm}',DEFAULT)";
    
    require_once("query.php");
    

?>
