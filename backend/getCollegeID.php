<?php
  
    // require connection
    // require $college
    
    // get college_id
    $sql = "SELECT * FROM colleges WHERE college = '{$college}';";

    $result = $con->query($sql);

    $college_id = 10;
    
    if ($result->num_rows > 0){
        $college_id = $result->fetch_assoc()['college_id'];
    }
    
?>
