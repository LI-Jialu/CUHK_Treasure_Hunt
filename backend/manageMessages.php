/*
Module to send message to another user

Module Name: ManageMessages
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   receiver_id: the user_id of the user to whom you want to send a message
   message: the message body (should not exceed 200 characters)

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php
require_once('connectDB.php');
require_once('userAuthentication.php');

$receiver_id = $_POST['receiver_id'];
$message = $_POST['message'];

$sql = "INSERT INTO messages VALUES (DEFAULT,{$user_id},{$receiver_id},'{$message}',DEFAULT);";

require_once('query.php');
?>
