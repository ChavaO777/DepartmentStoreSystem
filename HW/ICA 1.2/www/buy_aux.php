<?php 

    parse_str($_SERVER["QUERY_STRING"], $query_array);

    foreach($query_array as $key => $value) {
        echo '<p> product_id = ' . $key . '; amount = ' . $value . '\n</p>';
    }
?>