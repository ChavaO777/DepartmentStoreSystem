<!DOCTYPE html>
<html lang="es">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Liverpool database">
    <meta name="author" content="Salvaor & Aranzza">

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

    <footer class="text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Producto:</h4>
            <div align="center">
          <select class="btn btn-primary text-center text-uppercase font-awesome">
            <optgroup label="Él">
              <option>Playera cuello redondo</option>
              <option>Tenis de piel</option>
              <option>Chamarra lisa</option>
            </optgroup>
            <optgroup label="Electrónicos">
              <option>iPad Pro</option>
              <option>Pantalla Sony</option>
              <option>Gamer HP Omen AMD</option>
            </optgroup>
            <optgroup label="Electrónicos">
              <option>iPad Pro</option>
              <option>Pantalla Sony</option>
              <option>Gamer HP Omen AMD</option>
            </optgroup>
            <optgroup label="Ella">
              <option>Bolsa crossbody lisa</option>
              <option>Zapatos rockpot</option>
              <option>Lente solar</option>
            </optgroup>
            <optgroup label="Línea blanca">
              <option>Máquina de espresso</option>
              <option>Lavadora 23 kg</option>
              <option>Máquina de palomitas</option>
            </optgroup>
            <optgroup label="Muebles">
              <option>Colecho prinsel</option>
              <option>Puff basic</option>
              <option>Lámpara circular</option>
            </optgroup>
          </select>
        </div>
          </div>
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Precio:</h4>
            <h5 class="text-secondary text-uppercase mb-4" id="priceLabel">0.00</h5>
          </div>
          <div class="col-md-4" align="center">
            <h4 class="text-uppercase mb-4">Cantidad:</h4>
            <h5 class="text-secondary text-uppercase" id="quantityLabel"><input style="width: 80px" type="text" name="name" value="1">
            <button class="plus-btn btn btn-primary text-center" type="button" name="button" style="height: 30px">+</button></h5>
          </div>
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Cantidad</th>
                  <th>Nombre</th>
                  <th>Precio</th>
                  <th>Importe</th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
      </div>
    </footer>
  </section>


    <!-- inventario Section -->
    <section class="bg-primary text-white mb-0" id="inventario">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">inventario</h2>
        <hr class="star-light mb-5">

        <div class="table-responsive">
          <table class="table">
            <thead>
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
                include 'database.php';
                $pdo = Database::connect();
                // $sql = "SELECT * from product";
                $sql = "SELECT p.id, p.name, d.name, p.price, p.sku FROM product p JOIN category c ON p.category = c.id JOIN department d ON c.department = d.id JOIN branch b ON d.branch = 'B0710' GROUP BY p.id ORDER BY d.name";
                foreach ($pdo->query($sql) as $row) {
                  echo '<tr>';                  
                    echo '<td>'. $row['id'] . '</td>';
                    echo '<td>'. $row['name'] . '</td>';
                    echo '<td>'. $row['d.name'] . '</td>';
                    echo '<td>'. $row['price'] . '</td>';
                    echo '<td>'. $row['sku'] . '</td>';
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
                  <th>Cliente</th>
                  <th>Venta</th>
                  <th>Importe</th>
                </tr>
              </thead>
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
        <small>Copyright &copy; Your Website 2018</small>
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

    <!-- Custom scripts for this template -->
    <script src="js/freelancer.min.js"></script>

    <script type="text/javascript">
      $('.plus-btn').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var $input = $this.closest('div').find('input');
        var value = parseInt($input.val());

        if (value < 100) {
          value = value + 1;
        } else {
          value =100;
        }

        $input.val(value);
      });

      $('.like-btn').on('click', function() {
        $(this).toggleClass('is-active');
      });
    </script>

  </body>

</html>
