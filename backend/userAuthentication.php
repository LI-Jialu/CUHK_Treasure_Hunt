/*
Module for user authentication, http Basic Authentication is used

Module Name: UserAuthentication
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters: (processed and encoded in the app)
   user_id
   password

Output Parameters:
   fail (if authentication fails. connection will also be closed)
*/
<?php

    $user_id = $_SERVER['PHP_AUTH_USER'];
    $password = $_SERVER['PHP_AUTH_PW'];

if ($user_id === null || $password == null){
    echo "fail";
    die();
}

// authenticate user
$sql = "SELECT password FROM users WHERE user_id = {$user_id}";

$result = $con->query($sql);

// close connection if password is incorrect

if ($result->fetch_assoc()['password'] !== $password){
    echo "fail";
    die();
}
    
?>

