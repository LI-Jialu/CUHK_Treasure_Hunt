<?php

    $result = $con->query($sql);

    $rows = array();

    while ($r = $result->fetch_assoc()){
        $rows[] = $r;
    }
    
    echo json_encode($rows);

?>
