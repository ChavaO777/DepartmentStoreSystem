<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit appointment</title>

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
          <div class="intro-heading text-uppercase" style="color: #ffc107">Edit appointment</div>
        </div>
      </div>
    </header>

    <section>

        <?php
        require_once "../../models/Appointment.php";
        require_once "../../models/AppointmentType.php";
        require_once "../../models/Patient.php";
        require_once "../../models/Dentist.php";

        $id = filter_input(INPUT_GET, 'appointment', FILTER_VALIDATE_INT);
        if( ! $id ){
            header("Location:" . Appointment::baseurl() . "/index.php");
        }
        $db = new Database;
        $newAppointment = new Appointment($db);
        $newAppointment->setId($id);
        $appointment = $newAppointment->get();
        // $newAppointment->checkAppointment($appointment);
        ?>

        <div class="container">
            <div class="col-lg-12">
                <form action="<?php echo Appointment::baseurl() ?>/app/appointment/update_appointment.php" method="POST">
                    <center>

                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="date_time">Date and time</h2>

                            <?php
                                $datetime = new DateTime($appointment->date_time);
                            ?>

                            <!-- TODO: make the default value of the date to be the past date of the appointment -->
                            <input type="datetime-local" style="width: 500px" class="text-center btn btn-primary" name="date_time" id="date_time" value="<?php echo $datetime->format('Y-m-d H:i:s'); ?>">
                        </div>
                        
                        <div class="form-group">
                            <h1>Patient: <?php echo $appointment->p_firstname . " " .  $appointment->p_lastname?></h1>
                            <input type="hidden" name="patient_id" id="patient_id" value="<?php echo $appointment->p_id ?>" />
                        </div>

                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="appointment_id">Appointment Type</h2>
                            
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
                       
                        <div class="form-group">

                        <h2 class="section-heading text-uppercase"  for="date_time">Must be rescheduled</h2>
                        <select style="width: 500px" class="text-center btn btn-primary" id="must_be_rescheduled" name="must_be_rescheduled">
                            <option value="true">Yes</option>
                            <option selected value="false">No</option>
                        </select>
                    </div>

                    <input type="hidden" name="id" value="<?php echo $appointment->id ?>" />
                    <input type="submit" name="submit" class="btn btn-primary" value="UPDATE APPOINTMENT"/>

                    </center>
                </form>
            </div>
        </div>
    </section>
</body>
</html>