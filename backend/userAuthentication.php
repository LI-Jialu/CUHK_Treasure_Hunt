<?php

$user_id = $_GET['user_id'];
$password = $_GET['password'];

if ($user_id === null || $password == null){
    echo "fail";
    die();
}

// authenticate user
$sql = "SELECT password FROM users where user_id = '{$user_id}'";

$result = $con->query($sql);

// close connection if password is incorrect

if ($result->fetch_assoc()['password'] !== $password){
    echo "fail";
    die();
}
    
?>

