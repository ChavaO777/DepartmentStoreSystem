<html>
    <head>
        <title>Prueba de PHP</title>
    </head>
    <body>
        <?php 

            parse_str($_SERVER["QUERY_STRING"], $query_array);
            // echo $_SERVER['QUERY_STRING']; 

            foreach($query_array as $key => $value) {
                echo 'product_id = ' . $key . '; amount = ' . $value . '\n';
            }
        ?>
    </body>
</html>