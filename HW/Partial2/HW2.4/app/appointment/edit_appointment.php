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
                            <input type="text" style="width: 500px" name="date_time" value="<?php echo $appointment->date_time ?>" class="form-control text-center" id="date_time" placeholder="date_time">
                        </div>
                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="patient_id">Patient ID</h2>
                            <input type="number" style="width: 500px" name="patient_id" value="<?php echo $appointment->p_id ?>" class="form-control text-center" id="patient_id" placeholder="patient_id">

                            <?php
                            $db = new Database;
                            $newAppointmentToPatient = new Appointment($db);
                            $appointmentToPatient = $newAppointmentToPatient->getPatientNames();
                            ?>
                            <table class="table text-center" style="width: 500px">
                                <tr>
                                    <th style="color: #ffc107">ID</th>
                                    <th style="color: #ffc107">Name</th>
                                </tr>
                                <tbody>
                                    <?php foreach( $appointmentToPatient as $app )
                                      {
                                      ?>
                                    <td><?php echo $app->p_id ?></td>
                                    <td><?php echo $app->p_firstname ?> <?php echo $app->p_lastname ?></td>
                                </tbody>
                                <?php
                                }
                                ?>
                            </table>
                        </div>
                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="appointment_id">Appointment ID</h2>
                            <input type="number" style="width: 500px" name="appointment_id" value="<?php echo $appointment->appt_id ?>" class="form-control text-center" id="appointment_id" placeholder="appointment_id">

                            <?php
                            $db = new Database;
                            $newAppointmentToType = new Appointment($db);
                            $appointmentToType = $newAppointmentToPatient->getAppointmentNames();
                            ?>
                            <table class="table text-center" style="width: 500px">
                                <tr>
                                    <th style="color: #ffc107">ID</th>
                                    <th style="color: #ffc107">Name</th>
                                </tr>
                                <tbody>
                                    <?php foreach( $appointmentToType as $appType )
                                      {
                                      ?>
                                    <td><?php echo $appType->app_id ?></td>
                                    <td><?php echo $appType->app_name ?></td>
                                </tbody>
                                <?php
                                }
                                ?>
                            </table>
                        </div>

                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="dentist_id">Dentist ID</h2>
                            <input type="number" style="width: 500px" name="dentist_id" value="<?php echo $appointment->d_id ?>" class="form-control text-center" id="dentist_id" placeholder="dentist_id">

                            <?php
                            $db = new Database;
                            $newAppointmentToDentist = new Appointment($db);
                            $appointmentToDentist = $newAppointmentToDentist->getDentistNames();
                            ?>
                            <table class="table text-center" style="width: 500px">
                                <tr>
                                    <th style="color: #ffc107">ID</th>
                                    <th style="color: #ffc107">Name</th>
                                </tr>
                                <tbody>
                                    <?php foreach( $appointmentToDentist as $appDentist )
                                      {
                                      ?>
                                    <td><?php echo $appDentist->d_id ?></td>
                                    <td><?php echo $appDentist->d_firstname ?> <?php echo $appDentist->d_lastname ?></td>
                                </tbody>
                                <?php
                                }
                                ?>
                            </table>
                        </div>
                        <div class="form-group">

                        <h2 class="section-heading text-uppercase"  for="date_time">Must be rescheduled</h2>
                        <select style="width: 500px" class="text-center btn btn-primary" name = "must_be_rescheduled" value="0">
                            <option value="null" disabled selected>Option</option>
                            <option id="must_be_rescheduled" value="true">Yes</option>
                            <option id="must_be_rescheduled" value="false">No</option>
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