<?php
require_once("connectDB.php");

if ($_GET['email'] === NULL || $_GET['password'] === NULL){
        echo "No email/password received.";
        die();
}

$email = $_GET['email'];
$password = $_GET['password'];

$sql = "SELECT u.user_id, u.username, c.college, u.year, u.dorm, u.reputation FROM users u JOIN colleges c USING (college_id) WHERE email='{$email}' AND password='{$password}'";

$result = $con->query($sql);

if ($result->num_rows>0){
        echo json_encode($result->fetch_assoc());
}
else {
        echo json_encode(array("user_id"=>-1));
}
?>

