<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit patient</title>

    <!-- Bootstrap core CSS -->
    <link href="../../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="../../css/agency.min.css" rel="stylesheet">
</head>
<body>

    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-heading text-uppercase" style="color: #ffc107">Edit patient</div>
        </div>
      </div>
    </header>

    <?php
        require_once "../../models/Patient.php";
        $id = filter_input(INPUT_GET, 'patient', FILTER_VALIDATE_INT);
        if( ! $id ){
            header("Location:" . Patient::baseurl() . "/index.php");
        }
        $db = new Database;
        $newPatient = new Patient($db);
        $newPatient->setId($id);
        $patient = $newPatient->get();
        $newPatient->checkPatient($patient);
    ?>

    <section>
        <div class="container">
            <div class="col-lg-12">
                <form action="<?php echo Patient::baseurl() ?>/app/patient/update_patient.php" method="POST">
                    <center>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="firstname">First name</h2>
                        <input type="text" style="width: 500px" name="firstname" value="<?php echo $patient->first_name ?>" class="form-control text-center" id="firstname" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="lastname">Last name</h2>
                        <input type="text" style="width: 500px" name="lastname" value="<?php echo $patient->last_name ?>" class="form-control text-center" id="lastname" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="birthdate">Birthdate</h2>
                        <input type="date" style="width: 500px" name="birthdate" value="<?php echo $patient->birthdate ?>" class="form-control text-center" id="birthdate" placeholder="Birthdate">
                    </div>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="email">email</h2>
                        <input type="text" style="width: 500px" name="email" value="<?php echo $patient->email ?>" class="form-control text-center" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="cellphone">Cellphone</h2>
                        <input type="text" style="width: 500px" name="cellphone" value="<?php echo $patient->cellphone ?>" class="form-control text-center" id="cellphone" placeholder="Cellphone">
                    </div>
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="createdAt">Created at</h2>
                        <input type="text" style="width: 500px" name="createdAt" value="<?php echo $patient->created_at ?>" class="form-control text-center" id="createdAt" placeholder="createdAt">
                    </div>
                    <input type="hidden" name="id" value="<?php echo $patient->id ?>" />
                    <input type="submit" name="submit" class="btn btn-primary" value="UPDATE PATIENT" />
                    </center>
                </form>
            </div>
        </div>
    </section>
</body>
</html>