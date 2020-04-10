// query the database and send back the output.
// used for SELECT query only

<?php

    $result = $con->query($sql);

    $rows = array();

    while ($r = $result->fetch_assoc()){
        $rows[] = $r;
    }
    
    echo json_encode($rows);

?>
