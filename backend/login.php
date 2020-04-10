<?php
    require_once("connectDB.php");

    $student_id = $_SERVER['PHP_AUTH_USER'];
    $password = $_SERVER['PHP_AUTH_PW'];

    $sql = "SELECT user_id, password FROM users WHERE student_id = '{$student_i$
    
    $result = $con->query($sql);
    
    $res = $result->fetch_assoc();
    if ($res['password'] == $password){
        echo $res['user_id'];
    }
    else {
        echo -1;
    }

?>

