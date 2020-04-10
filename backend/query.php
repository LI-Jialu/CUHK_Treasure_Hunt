// query the database and send back the status (success/fail);
// used for DELETE, INSERT, UDPATE queries

<?php

    $result = $con->query($sql);
    
    if ($result->affected_rows>=0){ // might have to change it to strictly > 0
        echo "success";
    }
    else {
        echo "fail";
    }
    
?>



