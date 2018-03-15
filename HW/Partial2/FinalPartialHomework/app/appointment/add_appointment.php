<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Add appointment</title>

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
          <div class="intro-heading text-uppercase" style="color: #ffc107">Add appointment</div>
        </div>
      </div>
    </header>

    <section><center>
        <?php
        require_once "../../models/Appointment.php";
        ?>

        <div class="container">
            <div class="col-lg-12">
                <form action="<?php echo Appointment::baseurl() ?>/app/appointment/save_appointment.php" method="POST">
                    <div>
                        <h2 class="section-heading text-uppercase" for="date_time">Patient</h2>
                        <select style="width: 500px" class="text-center btn btn-primary" name = "patient">
                            <option value="null" disabled selected>Patient</option>
                            <?php
                            require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Appointment.php";
                            $db = new Database;
                            $appointment = new Appointment($db);
                            $appointments = $appointment->getPatientNames();

                            foreach( $appointments as $appointment )
                            {        
                            ?>
                            <option value="<?php echo $appointment->p_id ?>"  ><?php echo $appointment->p_firstname ?> <?php echo $appointment->p_lastname ?></option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>

                    <div class="container">

                        <h2 class="section-heading text-uppercase" for="date_time">Date & time</h2>
                        <input type="text" style="width: 500px" name="date_time" value="" class="form-control text-center" id="date_time" placeholder="YYYY-MM-DD HH:MM:SS">
                    </div>

                    <div class="container">

                        <h2 class="section-heading text-uppercase" for="appointment_type">Appointment type</h2>
                        <select style="width: 500px" class="text-center btn btn-primary" name = "appointment_type">
                            <option value="null" disabled selected>Appointment type</option>
                            <?php
                            require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Appointment.php";
                            $db = new Database;
                            $appointment = new Appointment($db);
                            $appointments = $appointment->getAppointmentNames();

                            foreach( $appointments as $appointment )
                            {        
                            ?>
                            <option value="<?php echo $appointment->app_id ?>"  ><?php echo $appointment->app_name?></option>
                            <?php
                            }
                            ?>
                        </select>
                    </div>
                </form>
            </div>
        </div>
    </section></center>
</body>
</html>