<?php

    //Initialize session variable
    if($_SESSION["wholeURLParameters"] == null){

        $_SESSION["wholeURLParameters"] = $_SERVER['QUERY_STRING'];
    }

    //Parse URL with parameters as a String
    if($query_array == null){

        parse_str($_SESSION["wholeURLParameters"], $query_array);
    }

    //Initialize error variables
    $nameError = null;
    $lastnameError = null;

    if(!empty($_POST)){

        //Customer information variables
        $name = null;
        $lastname = null;

        //Verification of data on input text
        if(isset($_POST['customer_name'])) 
            $name = $_POST['customer_name'];

        if(isset($_POST['customer_lastname']))  
            $lastname = $_POST['customer_lastname'];

        /*Avoid "undefined index" error
        if(isset($name)){ 
            echo $name;
        }

        if(isset($lastname)){ 
            echo $lastname;
        }*/

        //Input validation
        $valid = true;
        
        // Validation if user did not write on any of them
        if (empty($name)) {
            $nameError = 'Por favor, escribe un nombre.';
            $valid = false;
        }
        if (empty($lastname)) {
            $lastnameError = 'Por favor, escribe un apellido.';
            $valid = false;
        }

        //If user did
        if ($valid) {

            //Initialize mysql
            $link = mysqli_connect("localhost", "root", "MyNewPass", "liverpool");

            // Start of transaction
            $link->autocommit(FALSE);
            $link->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

            // Mysql query to insert a new customer depending on user input
            $sql_insertCustomer = "INSERT INTO customer (id,name,last_name) values(null,'" . "$name" . "','" . "$lastname" . "')"; 
            $result_insertCustomer = $link->query($sql_insertCustomer);

            // Mysql query to get the last insert id in customer table
            $sql_getRecentlyInsertedCustomerID = "SELECT LAST_INSERT_ID() INTO @newCustomer_id";
            $link->query($sql_getRecentlyInsertedCustomerID);

            // Mysql query to insert a new sale, using the last insert id
            $sql_createSale = "INSERT INTO sale (id,customer,date_time) values(null,@newCustomer_id,NOW())";
            $result_insertSale = $link->query($sql_createSale);

            // Mysql query to get the last insert id in sale table
            $sql_getRecentlyInsertedSaleID = "SELECT LAST_INSERT_ID() INTO @newSale_id";
            $link->query($sql_getRecentlyInsertedSaleID);

            // Variables to validate if the following queries are correct
            $allSaleProductsInsertionsAreOk = true;
            $allSKUUpdatesAreOk = true;

            // Traverse through the map of (key=product_id, value=product_amount)
            foreach($query_array as $product_id => $product_amount) {

                // Mysql query to insert a new sale_product
                $sql_createSaleProduct = "INSERT INTO sale_product (sale,product,quantity) values(@newSale_id,'" . $product_id . "',$product_amount)";
                $result_insertSaleProduct = $link->query($sql_createSaleProduct);

                // Mysql query to get stock of the product the user will buy
                $sql_selectCurrentSKU = "SELECT sku FROM product WHERE id = " . $product_id;
                $result_selectedSKU = $link->query($sql_selectCurrentSKU);

                // While loop to store the query value in a php variable and substract the number of products the user will buy: generating new stock value
                while($row = $result_selectedSKU->fetch_assoc()){
                   $result = $row['sku'] - $product_amount;
                }

                // Validation: sku cannot be negative, it cannot sell more products than stock number
                if($result >= 0){
                    // Mysql query to update stock value
                    $sql_updateSKU = "UPDATE product SET sku = $result WHERE id = " . $product_id;
                    $result_updateSKU = $link->query($sql_updateSKU);
                } else {
                    // Redirect to error page
                    header("Location: error.php");
                    die;
                }
                
                // Flags to know if transactions where correctly done
                if($result_insertSaleProduct == false AND $result_updateSKU == false AND $result_selectedSKU == false){

                    $allSaleProductsInsertionsAreOk = false;
                    $allSKUUpdatesAreOk = false;
                    break;
                }
            }
             // Validation of flags to commit
            if ($result_insertCustomer and $result_insertSale and $result_selectedSKU and $allSaleProductsInsertionsAreOk and $allSKUUpdatesAreOk) {
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

        <!-- Tag to include special characters -->
        <meta charset="utf-8">
        <!-- Tag to create a responsive web site -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Web site information: Salvador Orozco Villalever A07104218 & Aranzza Abascal Fararoni A01329203 -->
        <meta name="description" content="Liverpool database">
        <meta name="author" content="Salvador & Aranzza">

        <!-- Page title -->
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

            <!-- First section -->
            <div class="container">

            <!-- "Liverpool" title -->
            <a class="navbar-brand js-scroll-trigger" href="#page-top">Liverpool</a>
        </nav>
        <header>
            <div class="container">
                <img class="img-fluid mb-5 d-block mx-auto" src="img/logo.png" alt="" width="100">
            </div>
        </header>
        <!-- Form tag to call php code -->
        <form action= <?php echo "buy.php?" . $_SESSION["wholeURLParameters"] ?> method="post">
            <section class="comprar" id="customerInformation">
                <div class="container">
                    <!-- "Información del cliente" title -->
                    <h2 class="text-center text-uppercase text-secondary mb-0">Información del cliente</h2>
                    <hr class="star-dark mb-5">
                </div>
                <div class="container text-center">
                    <h4 class="text-uppercase mb-4">Nombre:</h4>
                    <center>
                    <!-- Input text to user write his/her name -->
                    <input name="customer_name" type="text"  placeholder="Dan" value="<?php echo !empty($customer_name)?$customer_name:'';?>">
                                <?php if (($nameError != null)) ?>
                                    <span class="help-inline"><?php echo $nameError;?></span>
                    </center>
                    <p class="help-block text-danger"></p>
                </div>
                <div class="container text-center">
                    <h4 class="text-uppercase mb-4">Apellido:</h4>
                    <center>
                    <!-- Input text to user write his/her lastname -->
                    <input name="customer_lastname" type="text"  placeholder="Pérez" value="<?php echo !empty($customer_lastname)?$customer_lastname:'';?>">
                                <?php if (($lastnameError != null)) ?>
                                    <span class="help-inline"><?php echo $lastnameError;?></span>
                    </center>
                    <p class="help-block text-danger"></p>
                </div>

                <!-- Section to show which products user choose in last page -->
                <div class="container">
                    <h2 class="text-center text-uppercase text-secondary mb-0">Productos seleccionados</h2>
                    <hr class="star-dark mb-5">
                </div>
                <!-- Table with those products -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Importe</th>
                        </tr>
                    </thead>
                    <!-- Table body with php code -->
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
                        <!-- Button to confirm order and store all those information in the database -->
                        <button type="submit" class="btn btn-success">Confirmar compra</button>
                    </center>
                </div>
            </section>
        </form>

        <!-- Javascript code to generate URL with parameters -->
        <script src="js/sale.js"></script>
    </body>
</html>