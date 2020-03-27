<?php
require_once("connectDB.php");

if ($_GET['email'] === NULL || $_GET['password'] === NULL){
        echo "No email/password received.";
        die();
}

$email = $_GET['email'];
$pw = $_GET['password'];

$sql = "SELECT user_id FROM users WHERE email='{$email}' AND password = '{$pw}'$

$result = $con->query($sql);

if ($result->num_rows>0){
        echo 'success '.$result->fetch_assoc()['user_id'];
}
else {
        echo "fail";
}
?>

