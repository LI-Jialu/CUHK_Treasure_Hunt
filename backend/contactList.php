/*
Module to retrieve the contact list of the user logged in.

Module Name: ContactList
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   None

Output Parameters:
   array of contacts sorted by recency in json format. A user who has a more recent chat with the user logged in will be placed nearer to the front in the array.
*/
<?php
    
    require_once('connectDB.php');
    require_once('userAuthentication.php');
    
    $sql = "SELECT t2.user_id, u.username, m.message
    FROM
        (SELECT
            max(message_id) AS message_id, user_id
        FROM (SELECT
            message_id, CASE WHEN sender_id = {$user_id} THEN receiver_id ELSE sender_id END AS user_id
        FROM messages
        WHERE sender_id = {$user_id} OR receiver_id = {$user_id}) t1
        GROUP BY user_id) t2
    JOIN messages m
        USING (message_id)
    JOIN users u
        USING (user_id)
    ORDER BY message_id DESC
    LIMIT 100;";
    
    require_once('echo.php');
    
?>
