<?php

    // return the contact list of a user (userA)
    // return as array of associative arrays, with each element as another user that userA has chats with
    // the array is sorted in recency, the first user in the array is the most reccent person that engages in a chat with userA
    /*
     keys:
        user_id     : user id
        username    : username
        message     : latest message between userA and this user
    */
    
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
