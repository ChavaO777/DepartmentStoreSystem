<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit patient</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">
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
        require_once "../models/Dentist.php";
        $id = filter_input(INPUT_GET, 'patient', FILTER_VALIDATE_INT);
        if( ! $id ){
            header("Location:" . Patient::baseurl() . "index.php");
        }
        $db = new Database;
        $new = new Patient($db);
        $newPatient->setId($id);
        $patient = $newPatient->get();
        $newPatient->checkUser($patient);
    ?>
    <div class="container">
        <div class="col-lg-12">
            <h2 class="text-center text-primary">Edit patient <?php echo $patient->username ?></h2>
            <form action="<?php echo Patient::baseurl() ?>app/patient/update_patient.php" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" value="<?php echo $user->username ?>" class="form-control" id="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" value="<?php echo $user->password ?>" class="form-control" id="password" placeholder="Password">
                </div>
                <input type="hidden" name="id" value="<?php echo $user->id ?>" />
                <input type="submit" name="submit" class="btn btn-default" value="Update user" />
            </form>
        </div>
    </div>
</body>
</html>