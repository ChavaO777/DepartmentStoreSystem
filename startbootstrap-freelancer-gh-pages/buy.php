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
        <header>
            <div class="container">
                <img class="img-fluid mb-5 d-block mx-auto" src="img/logo.png" alt="" width="100">
            </div>
        </header>

        <section class="comprar" id="customerInformation">
            <div class="container">
                <h2 class="text-center text-uppercase text-secondary mb-0">Información del cliente</h2>
                <hr class="star-dark mb-5">
            </div>
            <div class="container text-center">
                <h4 class="text-uppercase mb-4">Nombre:</h4>
                <center>
                <input class="text-center" id="name" type="text" placeholder="Dan" required="required" data-validation-required-message="Please enter your name." style="width: 150px">
                </center>
                <p class="help-block text-danger"></p>
            </div>
            <div class="container text-center">
                <h4 class="text-uppercase mb-4">Apellido:</h4>
                <center>
                <input class="text-center" id="lastname" type="text" placeholder="Pérez" required="required" data-validation-required-message="Please enter your lastname." style="width: 150px">
                </center>
                <p class="help-block text-danger"></p>
            </div>

        </section>

        <section class="comprar" id="selectedProducts">
            <div class="container">
                <h2 class="text-center text-uppercase text-secondary mb-0">Productos seleccionados</h2>
                <hr class="star-dark mb-5">
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Importe</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    function getProductsToBuy() {
                        if (isset($_GET["product_id"]) && isset($_GET["product_amount"])) {
                            echo '<tr>';
                                
                                $product = $_GET["product_id"];
                                echo "<script language='text/javascript'>function getProductsToBuy() { alert('$product'); }</script>";

                            echo '</tr>';
                        }
                    }
                ?>
                </tbody>
            </table>

            <div class="form-group">
                <center>
                    <button onclick="" type="submit" class="btn btn-primary btn-xl">Confirmar compra</button>
                </center>
            </div>
        </section>

        <script src="js/sale.js" type="text/javascript"></script>
    </body>
</html>