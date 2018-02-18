<?php
  //Start a session
  session_start();
?>

<!DOCTYPE html>
<html lang="es">

  <head>

    <!-- Tag to include special characters -->
    <meta charset="utf-8">

    <!-- Tag to create a responsive web site -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Web application information -->
    <meta name="description" content="Liverpool database">

    <!-- Salvador Orozco Villalever: A07104218 & Aranzza Abascal Fararoni: A01329203 -->
    <meta name="author" content="Salvador & Aranzza">

    <!-- Web site name -->
    <title>Liverpool</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles -->
    <link href="css/freelancer.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">

      <!-- Creating pink section on top -->
      <div class="container">

        <!-- "Liverpool on left-top" -->
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Liverpool</a>

        <!-- Creating a menu button when screen gets smaller -->
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menú
          <i class="fa fa-bars"></i>
        </button>

        <!-- Buttons section: Comprar, Inventario, Ventas -->
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#comprar">comprar</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#ordenDeCompra">orden de compra</a>
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
        <!-- "Liverpool" title with star and two lines-->
        <img class="img-fluid mb-5 d-block mx-auto" src="img/logo.png" alt="" width="100">
        <h1 class="text-uppercase mb-0">Liverpool</h1>
        <h2 class="font-weight-light mb-0">Es parte de tu vida</h2>
      </div>
    </header>

    <!-- "Comprar" Section -->
    <section class="comprar" id="comprar">
        <div class="container">
          <h2 class="text-center text-uppercase text-secondary mb-0">comprar</h2>
          <hr class="star-dark mb-5">
        </div>

        <!-- Table to show products -->
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
            <!-- Table with php code to show the products using a mysql query -->
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

        <!-- "Comprar" button, it calls getProductsToBuy to know which products are selected  -->
        <div class="form-group">
          <center>
            <button onclick="getProductsToBuy()" class="btn btn-primary btn-xl">Compra</button>
          </center>
        </div>
    </section> 

    <!-- "Orden de compra" Section -->
    <section class="bg-primary text-white mb-0" id="ordenDeCompra">
      <div class="container">
        <!-- Orden de compra title with star and two lines -->
        <h2 class="text-center text-uppercase text-white">Orden de Compra</h2>
        <hr class="star-light mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto"></div>
        </div>
      </div>
    </section>

    <!-- "inventario" Section -->
    <section class="inventario" id="inventario">
      <div class="container">
        <!-- "Inventario title with a star and two lines" -->
        <h2 class="text-center text-uppercase text-secondary mb-0">inventario</h2>
        <hr class="star-dark mb-5">

        <!-- Responsive table to show id, name, department, price and sku from each product -->
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
            <!-- Table body with php code to show details using a mysql query -->
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

    <!-- "ventas" Section -->
    <section class="bg-primary text-white mb-0" id="ventas">
      <div class="container">
        <!-- Ventas title with star and two lines -->
        <h2 class="text-center text-uppercase text-white">ventas</h2>
        <hr class="star-light mb-5">
        <div class="row">
          <div class="col-lg-8 mx-auto"></div>
        </div>
      </div>
      <!-- Responsive table to show id, date_time, customer and total from each sale -->
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
          <!-- Table body with php code to show dateails using a mysql query -->
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

    <!-- Footer section to show branch information -->
    <footer class="footer text-center">
      <div class="container">
        <h4 class="text-uppercase mb-4">sucursal</h4>
        <p class="lead mb-0">Centro comercial Angelopolis
        <br>Local 42-A</p>
      </div>
    </footer> 

    <!-- Last section on page: copyright -->
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
