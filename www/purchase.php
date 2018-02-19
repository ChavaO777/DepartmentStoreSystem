<?php

    //Initialize session variable
    if($_SESSION["wholeURLParameters"] == null){

        $_SESSION["wholeURLParameters"] = $_SERVER['QUERY_STRING'];
    }

    //Parse URL with parameters as a String
    if($query_array == null){

        parse_str($_SESSION["wholeURLParameters"], $query_array);
    }

    //Initialize mysql
    $link = mysqli_connect("localhost", "root", "MyNewPass", "liverpool");

    // Start of transaction
    $link->autocommit(FALSE);
    $link->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

    // Mysql query to insert a new purchase order
    $sql_insertPurchaseOrder = "INSERT INTO purchase_order VALUES (null, null, NOW(), null, 'SUPPLIER01234567')";
    $result_insertPurchaseOrder = $link->query($sql_insertPurchaseOrder);

    // Mysql query to get the last insert id in purchase order table
    $sql_getRecentlyInsertedPurchaseOrderID = "SELECT LAST_INSERT_ID() INTO @newPurchaseOrder_id";
    $link->query($sql_getRecentlyInsertedPurchaseOrderID);

    $allSelectionsAreOK = true;
    $allUpdatesAreOK = true;
    $allInsertionsAreOK = true;

    foreach($query_array as $product_id => $product_amount) {

        // Mysql query to select price of the product the company will buy
        $sql_getProductPrice = "SELECT price FROM product WHERE id = " . $product_id;

        // Traverse through the map of (row = product_price)
        foreach ($link->query($sql_getProductPrice) as $row){

            // Mysql to insert on purchase_order_product table
            $sql_insertPurchaseOrderProduct = "INSERT INTO purchase_order_product VALUES (null, '" . $product_id . "', $product_amount, '" . $row . "', @newPurchaseOrder_id)";
            $result_insertPurchaseOrderProduct = $link->query($sql_insertPurchaseOrderProduct);

            // Mysql query to get stock of the product the company will buy
            $sql_selectCurrentSKU = "SELECT sku FROM product WHERE id = " . $product_id;
            $result_selectedSKU = $link->query($sql_selectCurrentSKU);

            // While loop to store the query value in a php variable and substract the number of products the user will buy: generating new stock value
            while($sku = $result_selectedSKU->fetch_assoc()){
               $result = $sku['sku'] + $product_amount;
            }

            // Mysql query to update stock value
            $sql_updateSKU = "UPDATE product SET sku = $result WHERE id = " . $product_id;
            $result_updateSKU = $link->query($sql_updateSKU);

            if($result_insertPurchaseOrderProduct == false AND $result_selectedSKU == false AND $result_updateSKU == false ){

                $allInsertionsAreOK = false;
                $allUpdatesAreOK = false;
                $allSelectionsAreOK = false;
                break;

            }
        }
    }

    if($allSelectionsAreOK AND $allUpdatesAreOK AND $allInsertionsAreOK){
        $link->commit();
    } else {        
        $link->rollback();
    }

    //Close the DB
    $link->close();
    header("Location: index.php");
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
        <form action= <?php echo "purchase.php?" . $_SESSION["wholeURLParameters"] ?>>
            <section class="comprar" id="confirmation">
                
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