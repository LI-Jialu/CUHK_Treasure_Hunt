/*
Module to query the database and return the status of the query (success/fail)

Module Name: Query
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Used for DELETE, INSERT, UPDATE queries
Output will be 'success' or 'fail'. (string, not json encoded)
*/

<?php

    $result = $con->query($sql);

    if ($result){
        echo "success";
    }
    else {
        echo "fail";
    }
    
?>
