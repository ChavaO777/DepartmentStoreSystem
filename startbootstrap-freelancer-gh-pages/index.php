<?php
  //Start a session
  session_start();
?>

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

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">

      <!-- División de la primera sección -->
      <div class="container">

        <!-- Título "Liverpool" en la parte superior izquierda -->
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Liverpool</a>

        <!-- Botón de menú cuando se haga chica la pantalla -->
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menú

          <!-- Ícono de 3 líneas horizontales para el menú -->
          <i class="fa fa-bars"></i>
        </button>

        <!-- Sección de los botones -->
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#comprar">Comprar</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#inventario">inventario</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#ventas">ventas</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container">
        <img class="img-fluid mb-5 d-block mx-auto" src="img/logo.png" alt="" width="100">
        <h1 class="text-uppercase mb-0">Liverpool</h1>
        <h2 class="font-weight-light mb-0">Es parte de tu vida</h2>
      </div>
    </header>

    <!-- comprar Grid Section -->

    <section class="comprar" id="comprar">
        <div class="container">
          <h2 class="text-center text-uppercase text-secondary mb-0">comprar</h2>
          <hr class="star-dark mb-5">
        </div>

        <div class="table-responsive">
          <table class="table text-center">
            <thead class="text-uppercase">
              <tr>
                <th>Nombre producto</th>
                <th>Departamento</th>
                <th>Precio unitario</th>
                <th>Cantidad</th>
              </tr>
            </thead>
            <tbody>
              <?php

                require_once('database.php');
                
                $pdo0 = Database::connect();
                $sql = "SELECT p.id as 'product_id', p.name as 'product_name', d.name as 'department_name', p.price as 'product_price', p.sku as 'product_sku' FROM product p JOIN category c ON p.category = c.id JOIN department d ON c.department = d.id JOIN branch b ON d.branch = 'B0710' GROUP BY p.id ORDER BY d.name";
                foreach ($pdo0->query($sql) as $row) {
                  echo '<tr>';
                    echo '<td>' . $row['product_name'] . '</td>';
                    echo '<td>' . $row['department_name'] . '</td>';
                    echo '<td> $' . $row['product_price'] . '</td>';
                    echo '<td><input id="' . $row['product_id'] . '" class="product-amount" type="number" placeholder="0" text-center style="width: 50px" min="0" autocomplete="off" max="' . $row['product_sku'] . '"></td>';
                  echo '</tr>';
                }
                Database::disconnect();
              ?>
            </tbody>
          </table>
          
        </div>
        <div class="form-group">
          <center>
            <button onclick="getProductsToBuy()" class="btn btn-primary btn-xl">Compra</button>
          </center>
        </div>
    </section> 


    <!-- inventario Section -->
    <section class="bg-primary text-white mb-0" id="inventario">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">inventario</h2>
        <hr class="star-light mb-5">

        <div class="table-responsive">
          <table class="table text-center">
            <thead class = "text-uppercase">
              <tr>
                <th>ID</th>
                <th>Nombre producto</th>
                <th>Departamento</th>
                <th>Precio unitario</th>
                <th>Stock</th>
              </tr>
            </thead>
            <tbody>
              <?php 
                
                require_once('database.php');
                
                $pdo1 = Database::connect();
                $sql = "SELECT p.id as 'product_id', p.name as 'product_name', d.name as 'department_name', p.price as 'product_price', p.sku as 'product_sku' FROM product p JOIN category c ON p.category = c.id JOIN department d ON c.department = d.id JOIN branch b ON d.branch = 'B0710' GROUP BY p.id ORDER BY d.name";
                foreach ($pdo1->query($sql) as $row) {
                  echo '<tr>';                  
                    echo '<td>'. $row['product_id'] . '</td>';
                    echo '<td>'. $row['product_name'] . '</td>';
                    echo '<td>'. $row['department_name'] . '</td>';
                    echo '<td> $'. $row['product_price'] . '</td>';
                    echo '<td>'. $row['product_sku'] . '</td>';
                  echo '</tr>';
                }
                Database::disconnect();
              ?>
            </tbody>
          </table>
        </div>
    </section>

    <!-- ventas Section -->
    <section id="ventas">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">ventas</h2>
        <hr class="star-dark mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto"></div>
        </div>
      </div>
      <div class="table-responsive text-center">
        <table class="table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Fecha y hora</th>
              <th>Nombre del Cliente</th>
              <th>Importe total</th>
            </tr>
          </thead>
          <tbody>
            <?php 
              
              require_once('database.php');

              $pdo2 = Database::connect();
              $sql = "SELECT s.id as 'sale_id', s.date_time as 'date_time', c.name as 'customer_name', c.last_name as 'customer_lastname' , SUM(sp.quantity*product.price) as 'sale_total_amount' FROM sale_product sp LEFT JOIN product ON sp.product = product.id LEFT JOIN sale s ON sp.sale = s.id LEFT JOIN customer c ON s.customer = c.id GROUP BY sp.sale";
              
              foreach ($pdo2->query($sql) as $row) {
                echo '<tr>';                  
                  echo '<td>'. $row['sale_id'] . '</td>';
                  echo '<td>'. $row['date_time'] . '</td>';
                  echo '<td>'. $row['customer_name'] . ' ' . $row['customer_lastname'] . '</td>';
                  echo '<td> $'. $row['sale_total_amount'] . '</td>';
                echo '</tr>';
              }
              Database::disconnect();
            ?>
          </tbody>
        </table>
      </div>
    </section>

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <h4 class="text-uppercase mb-4">sucursal</h4>
        <p class="lead mb-0">Centro comercial Angelopolis
        <br>Local 42-A</p>
      </div>
    </footer> 

    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy; Salvador Orozco & Aranzza Abascal 2018</small>
      </div>
    </div>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- ventas Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <script src="js/sale.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/freelancer.min.js"></script>
}

  </body>

</html>
