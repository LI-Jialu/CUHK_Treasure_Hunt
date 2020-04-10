// query the database and send back the status (success/fail);
// used for DELETE, INSERT, UDPATE queries

<?php

    $result = $con->query($sql);

    if ($result){
        echo "success";
    }
    else {
        echo "fail";
    }
    
?>



