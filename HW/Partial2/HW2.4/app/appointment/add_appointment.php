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
            require_once "../../models/AppointmentType.php";
            require_once "../../models/Patient.php";
            require_once "../../models/Dentist.php";
        ?>

        <div class="container">
            <div class="col-lg-12">
                <form action="<?php echo Appointment::baseurl() ?>/app/appointment/save_appointment.php" method="POST">
                    <div class="form-group">
                        <h2 class="section-heading text-uppercase" for="date_time">Patient</h2>
                        
                        <select id="patient_id" name="patient_id">

                        <?php
                            $db = new Database;
                            $patient = new Patient($db);
                            $patients = $patient->get();    
                        ?>    

                        <?php 
                            foreach( $patients as $p )
                            {
                                echo "<option value='" . $p->id . "'>" . $p->first_name . " " . $p->last_name . "</option>";
                            }
                        ?>
                        </select>
                    </div>

                    <div class="form-group">

                        <h2 class="section-heading text-uppercase"  for="date_time">Date & time</h2>
                        <input type="datetime-local" style="width: 500px" class="text-center btn btn-primary" name="date_time" id="date_time">
                    </div>

                    <div class="form-group">

                        <h2 class="section-heading text-uppercase" for="appointment_type">Appointment type</h2>

                        <?php
                            $db = new Database;
                            $appointmentType = new AppointmentType($db);
                            $appointmentTypes = $appointmentType->get();  
                        ?>

                        <select id="appointment_id" name="appointment_id">

                        <?php
                           foreach( $appointmentTypes as $appointmentType )
                            {
                               echo "<option value='" . $appointmentType->id . "'>" . $appointmentType->description . " ($" . $appointmentType->price . ") </option>";
                            } 
                        ?>
                        </select>
                    </div>

                    <div class="form-group">

                        <h2 class="section-heading text-uppercase" for="dentist">Dentist</h2>

                        <?php
                            $db = new Database;
                            $dentist = new Dentist($db);
                            $dentists = $dentist->get();    
                        ?>

                        <select id="dentist_id" name="dentist_id">
                        
                            <?php
                                foreach( $dentists as $dentist )
                                {
                                    echo "<option value='" . $dentist->id . "'>Dr(a). " . $dentist->first_name . " " . $dentist->last_name . "</option>";
                                }
                            ?>
                        </select>
                    </div>

                    <div>
                        <input type="submit" name="submit" class="btn btn-primary" value="Save appointment" />
                    </div>
                </form>
            </div>
        </div>
    </section></center>

</body>
</html>