<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Liverpool database">
        <meta name="author" content="Salvador & Aranzza">

        <title>Liverpool</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">

    </head>

     <body id="page-top">
    
        <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">

            <!-- División de la primera sección -->
            <div class="container">

            <!-- Título "Liverpool" en la parte superior izquierda -->
            <a class="navbar-brand js-scroll-trigger" href="#page-top">Liverpool</a>
        </nav>
<<<<<<< HEAD

        <section class="comprar" id="comprar">
            <div class="container">
                <h2 class="text-center text-uppercase text-secondary mb-0">Ingresar datos del cliente</h2>
                <hr class="star-dark mb-5">
            </div>
        </section>
=======

        <?php 

            parse_str($_SERVER["QUERY_STRING"], $query_array);
            // echo $_SERVER['QUERY_STRING']; 

            foreach($query_array as $key => $value) {
                echo '<p> product_id = ' . $key . '; amount = ' . $value . '\n</p>';
            }
        ?>
>>>>>>> 82190d0d24f770a9ae32f7e9bf338e52e3c0d492
    </body>
</html>