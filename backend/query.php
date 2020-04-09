
<?php

    $result = $con->query($sql);
    
    if ($result->affected_rows>=0){ 
        echo "success";
    }
    else {
        echo "fail";
    }
    
?>



