/*
Module to post/update/delete an item

Module Name: ManageItems
Programmer: Hon Tik TSE
Version: 1.0 (10 May 2020)

Input Parameters:
   action: insert/update/delete
   item_id: for update, delete only
   name: for insert, update only
   price: for insert, update only
   quantity: for insert, update only
   description: for insert, update only, do not pass null.
   image: name for the image, can be null if no image uploaded

Output Parameters: (string, not json encoded)
   success/fail
*/
<?php
  
    require_once('connectDB.php');
    require_once('userAuthentication.php');

    $action = $_POST['action']; // insert, update, or delete
    $item_id = $_POST['item_id']; // needed for update, delete only
    $name = $_POST['name']; // needed for insert, update
    $price = $_POST['price']; // needed for insert, update
    $quantity = $_POST['quantity']; // needed for insert, update
    $description = $_POST['description']; // do not pass null, at least pass "", ***ADD \\\ before any '***, e.g. it's => it\\\'s
    $image = $_POST['image']; // the name for the image, can ignore if no image uploaded
    

    $sql;
    
    if ($action == 'insert'){
        if (empty($image)){
            $image = "noImageUploaded.png";
        }
        $sql = "INSERT INTO items VALUES (DEFAULT, {$user_id}, '{$name}', {$price}, {$quantity}, '{$description}',DEFAULT, '{$image}');";
        $result = $con->query($sql);
        if ($result){
            echo $con->insert_id;
        }
        else {
            echo "fail";
        }
    }
    else if ($action == 'update'){
        $image_sql = "";
        if (!empty($image)){
            $image_sql = ",image = '{$image}' ";
        }
        $sql = "UPDATE items SET name = '{$name}',price = {$price},description = '{$description}',quantity = {$quantity} {$image_sql} WHERE item_id = {$item_id} AND poster_id = {$user_id};";
        require_once('query.php');
    }
    else if ($action == 'delete'){
        $sql = "DELETE FROM items WHERE item_id = {$item_id} AND poster_id = {$user_id};";
        require_once('query.php');
    }

?>
