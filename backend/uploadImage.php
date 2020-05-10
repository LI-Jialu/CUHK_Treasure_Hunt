/*
Module to upload an image for the item

Module Name: UploadImage
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   name: name of the image (will be the name of the image in the server)
   image: image posted

Output Parameters: (string, not json encoded)
   name of the image posted
*/
<?php
    
    $name = $_POST['name'];
    $image = base64_decode($_POST['image']);
    $target_dir = "images/";
   
    file_put_contents($target_dir.$name, $image);
    echo $name;
?>
