<?php
require_once('connectDB.php');
require_once('userAuthentication.php');

$receiver_id = $_POST['receiver_id'];
$message = $_POST['message'];

$sql = "INSERT INTO messages VALUES (DEFAULT,{$user_id},{$receiver_id},'{$message}',DEFAULT);";

require_once('query.php');
?>
