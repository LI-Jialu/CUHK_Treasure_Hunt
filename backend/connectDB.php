/*
Module to connect to the MySQL database

Module Name: ConnectDB
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   None

Output Parameters:
   None
 
Note: the database credentials are not shown here for security purposes.
*/
<?php
$host="...";
$user="...";
$password="...";
$dbname="...";

$con = new mysqli($host, $user, $password, $dbname)
        or die ('Could not connect to the database server' . mysqli_connect_err$

?>


