<?php

    //Initialize session variable

    if($_SESSION["wholeURLParameters"] == null){

        $_SESSION["wholeURLParameters"] = $_SERVER['QUERY_STRING'];
    }

    if($query_array == null){

        parse_str($_SESSION["wholeURLParameters"], $query_array);
    }

    // require_once('database.php');

    $nameError = null;
    $lastnameError = null;

    if(!empty($_POST)){

        $name = null;
        $lastname = null;

        if(isset($_POST['customer_name'])) 
            $name = $_POST['customer_name'];

        if(isset($_POST['customer_lastname']))  
            $lastname = $_POST['customer_lastname'];

        if(isset($name)){ 
            echo $name;
        }

        if(isset($lastname)){ 
            echo $lastname;
        }

        // validate input
        $valid = true;
        
        if (empty($name)) {
            $nameError = 'Por favor, escribe un nombre.';
            $valid = false;
        }
        if (empty($lastname)) {
            $lastnameError = 'Por favor, escribe un apellido.';
            $valid = false;
        }
        // insert data
        if ($valid) {

            $link = mysqli_connect("127.0.0.1", "root", "", "liverpool");

            $link->autocommit(FALSE);
            $link->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

            // $pdo->query("START TRANSACTION");

            $sql_insertCustomer = "INSERT INTO customer (id,name,last_name) values(null,'" . "$name" . "','" . "$lastname" . "')"; 
            $result_insertCustomer = $link->query($sql_insertCustomer);

            $sql_getRecentlyInsertedCustomerID = "SELECT LAST_INSERT_ID() INTO @newCustomer_id";
            $link->query($sql_getRecentlyInsertedCustomerID);

            $sql_createSale = "INSERT INTO sale (id,customer,date_time) values(null,@newCustomer_id,NOW())";
            $result_insertSale = $link->query($sql_createSale);

            $sql_getRecentlyInsertedSaleID = "SELECT LAST_INSERT_ID() INTO @newSale_id";
            $link->query($sql_getRecentlyInsertedSaleID);

            $allSaleProductsInsertionsAreOk = true;
            $allSKUUpdatesAreOk = true;

            //Traverse through the map of (key=product_id, value=product_amount)
            foreach($query_array as $product_id => $product_amount) {

                $sql_createSaleProduct = "INSERT INTO sale_product (sale,product,quantity) values(@newSale_id,'" . $product_id . "',$product_amount)";
                $result_insertSaleProduct = $link->query($sql_createSaleProduct);

                $sql_currentSku = "SELECT sku FROM product WHERE id = '" . $product_id . "')";
                $result_selectCurrentSku = $link->query($sql_currentSku);

                $sql_updateSku = "UPDATE product SET sku = ' . $result_selectCurrentSku . ' WHERE id = '" . $product_id . "')";
                $result_updateSku = $link->query($sql_updateSku);

                if($result_insertSaleProduct == false and $result_updateSku == false){

                    $allSaleProductsInsertionsAreOk = false;
                    $allSKUUpdatesAreOk = false;

                    break;
                }
            }

            if ($result_insertCustomer and $result_insertSale and $allSaleProductsInsertionsAreOk and $allSKUUpdatesAreOk) {
                $link->commit();
            } else {        
                $link->rollback();
            }

            //Close the DB
            $link->close();

            header("Location: index.php");
        }
    }
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

        <form action= <?php echo "buy.php?" . $_SESSION["wholeURLParameters"] ?> method="post">
            <section class="comprar" id="customerInformation">
                <div class="container">
                    <h2 class="text-center text-uppercase text-secondary mb-0">Información del cliente</h2>
                    <hr class="star-dark mb-5">
                </div>
                <div class="container text-center">
                    <h4 class="text-uppercase mb-4">Nombre:</h4>
                    <center>
                    <!-- <input name="customer_name" value="<?php echo !empty($customer_name)?$customer_name:'';?>" class="text-center" id="name" type="text" placeholder="Dan" required="required" data-validation-required-message="Please enter your name." style="width: 150px"> -->
                    <input name="customer_name" type="text"  placeholder="Dan" value="<?php echo !empty($customer_name)?$customer_name:'';?>">
                                <?php if (($nameError != null)) ?>
                                    <span class="help-inline"><?php echo $nameError;?></span>
                    </center>
                    <p class="help-block text-danger"></p>
                </div>
                <div class="container text-center">
                    <h4 class="text-uppercase mb-4">Apellido:</h4>
                    <center>
                    <!-- <input name="customer_lastname" value="<?php echo !empty($customer_lastname)?$customer_lastname:'';?>" class="text-center" id="lastname" type="text" placeholder="Pérez" required="required" data-validation-required-message="Please enter your lastname." style="width: 150px"> -->
                    <input name="customer_lastname" type="text"  placeholder="Pérez" value="<?php echo !empty($customer_lastname)?$customer_lastname:'';?>">
                                <?php if (($lastnameError != null)) ?>
                                    <span class="help-inline"><?php echo $lastnameError;?></span>
                    </center>
                    <p class="help-block text-danger"></p>
                </div>

            <!-- </section> -->

            <!-- <section class="comprar" id="selectedProducts"> -->
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

                        require_once('database.php');
                        $pdo0 = Database::connect();
                        $sale_total_amount = 0.0;

                        //Traverse through the map(key=product_id, value=product_amount)
                        foreach($query_array as $key => $value) {

                            //Query string to get the product's name and its price
                            $sql = "SELECT p.id as 'product_id', p.name as 'product_name', p.price as 'product_price' FROM product p WHERE p.id = " . $key;
                            
                            //Query to get the data and create a row of the table
                            foreach ($pdo0->query($sql) as $row) {

                                echo '<tr>';
                                echo '<td>' . $key . '</td>';
                                echo '<td>' . $row['product_name'] . '</td>';
                                echo '<td> $ ' . $value * $row['product_price'] . '</td>';
                                echo '</tr>';

                                //Add to the total amount of the sale
                                $sale_total_amount += $value * $row['product_price'];
                            }
                        }
                        
                        //Show the total amount of the sale
                        echo '<tr>';
                        echo '<td></td>';
                        echo '<td class="text-uppercase text-secondary">Monto total de la compra</td>';
                        echo '<td> $ ' . $sale_total_amount . '</td>';
                        echo '</tr>';

                        //Disconnect the DB
                        Database::disconnect();
                    ?>
                    </tbody>
                </table>

                <div class="form-group">
                    <center>
                        <button type="submit" class="btn btn-success">Confirmar compra</button>
                        <!-- <button type="submit" class="btn btn-primary btn-xl">Confirmar compra</button> -->
                    </center>
                </div>
            </section>
        </form>

        <script src="js/sale.js"></script>
    </body>
</html>