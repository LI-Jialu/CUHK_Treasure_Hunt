/*
 Module to query the database return the data to the app in json format
 
 Module Name: Echo
 Programmer: Hon Tik TSE
 Version: 1.0 (10 May 2020)
 
 Used for SELECT queries.
 Each row will be converted into an associative array, with the column name as the key and the value as the value. The rows will be stored in an array. The resultant array will be json encoded.
 */

<?php

    $result = $con->query($sql);

    $rows = array();

    while ($r = $result->fetch_assoc()){
        $rows[] = $r;
    }
    
    echo json_encode($rows);

?>
