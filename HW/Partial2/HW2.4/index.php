<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Orthodontics Office</title>

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

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Orthodontics Office</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#dentists">Dentists</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#patients">Patients</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#appointments">appointments</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome To Our Office!</div>
          <div class="intro-heading text-uppercase">For happy healthy smile</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
        </div>
      </div>
    </header>

    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Services</h2>
            <h3 class="section-subheading text-muted">Orthodontics Office is a state-of-the-art, technologically advanced dental office, in a warm, spa-like setting.</h3>
          </div>
        </div>
      </div>
      <?php
        require_once $_SERVER['DOCUMENT_ROOT'] . "/models/AppointmentType.php";
        // require_once "./models/AppointmentType.php";
        $db = new Database;
        $appointmentType = new AppointmentType($db);
        $appointmentTypes = $appointmentType->get();        
      ?>

      <div class="container">
        <div class="col-lg-12">
          <h2 class="text-center text-primary">Appointment Types</h2>
          <!-- <div class="col-lg-1 pull-right" style="margin-bottom: 10px">
          <a class="btn btn-info" href="<?php //echo AppointmentType::baseurl() ?>/app/addAppointmentType.php">Add appointment type</a>
          </div> -->
          <?php
          if( ! empty( $appointmentTypes ) ) {
          ?>
          <table class="table text-centerd">
            <tr>
              <!-- <th>Id</th> -->
              <th>Description</th>
              <th>Time</th>
              <th>Price</th>
            </tr>
            <?php foreach( $appointmentTypes as $appointmentType )
            {
            ?>
            <tr>
            <!-- <td><?php //echo $appointmentType->id ?></td> -->
              <td><?php echo $appointmentType->description ?></td>
              <td><?php echo $appointmentType->minutes ?> minutes</td>
              <td>$ <?php echo $appointmentType->price ?></td>
                        
              <!-- <td>
              <a class="btn btn-info" href="<?php //echo AppointmentType::baseurl() ?>app/editAppointment.php?dentist=<?php //echo $appointmentType->id ?>">Edit</a> 
              </td>
              <td>
              <a class="btn btn-info" href="<?php //echo AppointmentType::baseurl() ?>app/deleteAppointment.php?dentist=<?php //echo $appointmentType->id ?>">Delete</a>
              </td> -->
            </tr>
            <?php
            }
            ?>
          </table>
          <?php
          }
          else
          {
          ?>
          <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered appointments types</div>
          <?php
          }
          ?>
        </div>
      </div>
    </section>

    <!-- dentists Grid -->
    <section class="bg-light" id="dentists">

      <?php
      // require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Dentist.php";
      require_once "./models/Dentist.php";
      $db = new Database;
      $dentist = new Dentist($db);
      $dentists = $dentist->get();        
      ?>

      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">dentists</h2>
            <h3 class="section-subheading text-muted">With emphasis in Cosmetic Dentistry and Facial Aesthetics, our specialized team is more than happy to take care of all of your dental needs.</h3>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="">
            <h4 style="color: #ffc107">Diana Garland</h4>
            <p class="text-muted">General dentist</p>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="">
            <h4 style="color: #ffc107">Larry Parker</h4>
            <p class="text-muted">Endodontist</p>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="team-member">
            <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
            <h4 style="color: #ffc107">Tyler Pertersen</h4>
            <p class="text-muted">Prosthodontist</p>
          </div>
        </div>
      </div>

      <div class="col-lg-12">
        <?php
        if( ! empty( $dentists ) ) {
        ?>
        <table class="table text-center">
          <tr>
            <!-- <th>Id</th> -->
            <th>Name</th>
            <th>Cellphone</th>
            <th>Email</th>
            <th>Birthdate</th>
            <th>Start date</th>
            <th>Status</th>
            <!-- <th>Edit</th>
            <th>Delete</th> -->
          </tr>
          <?php foreach( $dentists as $dentist )
          {
          ?>
          <tr>
          <!-- <td><?php //echo $dentist->id ?></td> -->
            <td><?php echo $dentist->first_name ?> <?php echo $dentist->last_name ?></td>
            
            <td><?php echo $dentist->cellphone ?></td>
            <td><?php echo $dentist->email ?></td>
            <td><?php echo $dentist->birthdate ?></td>
            <td><?php echo $dentist->start_date ?></td>
            <td><?php echo $dentist->status==1 ? "<font color='green'>Active</font>" : "<font color='red'>Deactivated</font>" ?></td>
                      
            <!-- <td>
            <a class="btn btn-info" href="<?php echo Dentist::baseurl() ?>app/  editDentist.php?dentist=<?php echo $dentist->id ?>">Edit</a> 
            </td>
            <td>
            <a class="btn btn-info" href="<?php echo Dentist::baseurl() ?>app/deleteDentist.php?dentist=<?php echo $dentist->id ?>">Delete</a>
            </td> -->
          </tr>
          <?php
          }
          ?>
        </table>
        <?php
        }
        else
        {
        ?>
        <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered dentists</div>
        <?php
        }
        ?>
      </div>
    </section>

    <!-- patients -->
    <section id="patients">

      <?php
        // require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Patient.php";
        require_once "./models/Patient.php";
        $db = new Database;
        $patient = new Patient($db);
        $patients = $patient->get();        
      ?>

      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">patients</h2>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="col-lg-12">
          <?php
          if( ! empty( $patients ) ) {
          ?>
          <table class="table text-center">
            <tr>
              <!-- <th>Id</th> -->
              <th>Name</th>
              <th>Birthdate</th>
              <th>Created at</th>
              <th>Email</th>
              <th>Cellphone</th>
              <th></th>
              <th></th>
            </tr>
            <?php foreach( $patients as $patient )
            {
            ?>
            <tr>
            <!-- <td><?php //echo $patient->id ?></td> -->
              <td><?php echo $patient->first_name ?> <?php echo $patient->last_name ?></td>
              <td><?php echo $patient->birthdate ?></td>
              <td><?php echo $patient->created_at ?></td>
              <td><?php echo $patient->email ?></td>
              <td><?php echo $patient->cellphone ?></td>
              
              <td>
                <a class="btn btn-primary" href="<?php echo Patient::baseurl() ?>/app/patient/edit_patient.php?patient=<?php echo $patient->id ?>">Edit</a> 
              </td>
              <td>
                <a class="btn btn-primary" href="<?php echo Patient::baseurl() ?>/app/patient/delete_patient.php?patient=<?php echo $patient->id ?>">Delete</a>
              </td>
            </tr>
            <?php
            }
            ?>
          </table>
          <?php
          }
          else
          {
          ?>
          <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered patients</div>
          <?php
          }
          ?>
        </div>
      </div>

      <div>
        <center>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="<?php echo Patient::baseurl() ?>/app/patient/add_patient.php">Add patient</a>
        </center>
      </div>

    </section>

    <!-- appointments -->
    <section class="bg-light" id="appointments">

      <div class="col-lg-12 text-center">

        <h2 class="section-heading text-uppercase">Appointments</h2>

        <div class="container">
          <div class="col-lg-12">
          </div>
        </div>

        <h3 class="section-subheading text-muted">Everyone should see a general dentist for routine oral health examinations, twice-yearly cleanings, and treatment of routine oral health complications, such as minor tooth decay.</h3>
      </div>

      <div class="container">

        <?php
        // require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Appointment.php";
        require_once "./models/Appointment.php";
        $db = new Database;
        $appointment = new Appointment($db);
        $pastAppointments = $appointment->getPastAppointments(); // current_date, current_date);  
        // $todaysAppointments = $appointment->get();
        //$appointments = $appointment->get();    
        ?>

        <div class="row">
          <div class="col-lg-12 text-center">

            <h4 style="color: #ffc107">Past appointments</h4>

            <div class="container">
              <div class="col-lg-12">
                <?php
                if( ! empty( $pastAppointments ) ) {
                ?>
                <table class="table text-center">
                  <tr>
                    <!-- <th>Id</th> -->
                    <th>Date & Time</th>
                    <th>Patient</th>
                    <th>Appointment Type</th>
                    <th>Dentist</th>
                    <!-- <th>Must be rescheduled</th> -->
                  </tr>
                  <?php foreach( $pastAppointments as $pastAppointment )
                  {
                  ?>
                  <tr>
                  <!-- <td><?php //echo $patient->id ?></td> -->
                    <td><?php echo $pastAppointment->date_time ?></td>
                    <td><?php echo $pastAppointment->p_firstname . " " . $pastAppointment->p_lastname ?></td>
                    <td><?php echo $pastAppointment->appt_description ?></td>
                    <td><?php echo $pastAppointment->d_firstname . " " . $pastAppointment->d_lastname ?></td>
                    <!-- <td><?php //echo $pastAppointment->app_rescheduled==1 ? "<font color='red'>Yes</font>" : "<font color='green'>No</font>" ?></td> -->
                  </tr>
                  <?php
                  }
                  ?>
                </table>
                <?php
                }
                else
                {
                ?>
                <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered appointments for today</div>
                <?php
                }
                ?>
              </div>
            </div>

          </div>
        </div>
      </div>

      <div class="container">

        <?php
        // require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Appointment.php";
        require_once "./models/Appointment.php";
        $db = new Database;
        $appointment = new Appointment($db);
        $todaysAppointments = $appointment->getTodaysAppointments(); // current_date, current_date);  
        // $todaysAppointments = $appointment->get();
        //$appointments = $appointment->get();    
        ?>

        <div class="row">
          <div class="col-lg-12 text-center">

            <h4 style="color: #ffc107">Today's appointments</h4>

            <div class="container">
              <div class="col-lg-12">
                <?php
                if( ! empty( $todaysAppointments ) ) {
                ?>
                <table class="table text-center">
                  <tr>
                    <!-- <th>Id</th> -->
                    <th>Date & Time</th>
                    <th>Patient</th>
                    <th>Appointment Type</th>
                    <th>Dentist</th>
                    <!-- <th>Must be rescheduled</th> -->
                  </tr>
                  <?php foreach( $todaysAppointments as $todaysAppointment )
                  {
                  ?>
                  <tr>
                  <!-- <td><?php //echo $patient->id ?></td> -->
                    <td><?php echo $todaysAppointment->date_time ?></td>
                    <td><?php echo $todaysAppointment->p_firstname . " " . $todaysAppointment->p_lastname ?></td>
                    <td><?php echo $todaysAppointment->appt_description ?></td>
                    <td><?php echo $todaysAppointment->d_firstname . " " . $todaysAppointment->d_lastname ?></td>
                    <!-- <td><?php //echo $todaysAppointment->app_rescheduled==1 ? "<font color='red'>Yes</font>" : "<font color='green'>No</font>" ?></td> -->
                  </tr>
                  <?php
                  }
                  ?>
                </table>
                <?php
                }
                else
                {
                ?>
                <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered appointments for today</div>
                <?php
                }
                ?>
              </div>
            </div>

          </div>
        </div>
      </div>
      
      <div class="container">

        <?php
        // require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Appointment.php";
        require_once "./models/Appointment.php";
        $db = new Database;
        $appointment = new Appointment($db);
        $appointments = $appointment->getFutureAppointments();    
        ?>

        <div class="row">
          <div class="col-lg-12 text-center">

            <h4 style="color: #ffc107">Future appointments</h4>

            <div class="container">
              <div class="col-lg-12">
                <?php
                if( ! empty( $appointments ) ) {
                ?>
                <table class="table text-center">
                  <tr>
                    <!-- <th>Id</th> -->
                    <th>Date & Time</th>
                    <th>Patient</th>
                    <th>Appointment Type</th>
                    <th>Dentist</th>
                    <th>Must be rescheduled</th>
                    <th></th>
                    <th></th>
                  </tr>
                  <?php foreach( $appointments as $appointment )
                  {
                  ?>
                  <tr>
                    <td><?php echo $appointment->date_time ?></td>
                    <td><?php echo $appointment->p_firstname . " " . $appointment->p_lastname ?></td>
                    <td><?php echo $appointment->appt_description ?></td>
                    <td><?php echo $appointment->d_firstname . " " . $appointment->d_lastname ?></td>
                    <td><?php echo $appointment->app_rescheduled==1 ? "<font color='red'>Yes</font>" : "<font color='green'>No</font>" ?></td>
                    <td>
                      <a class="btn btn-primary" href="<?php echo Appointment::baseurl()?>/app/appointment/edit_appointment.php?appointment=<?php echo $appointment->id ?>">Edit</a>
                    </td>
                    <td>
                      <a class="btn btn-primary" href="<?php echo Appointment::baseurl()?>/app/appointment/delete_appointment.php?appointment=<?php echo $appointment->id ?>">Delete</a>
                    </td>

                  </tr>
                  <?php
                  }
                  ?>
                </table>
                <?php
                }
                else
                {
                ?>
                <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered appointments in the future</div>
                <?php
                }
                ?>
              </div>
            </div>


          </div>
        </div>
      </div>
      <div>
        <center>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="<?php echo Appointment::baseurl() ?>/app/appointment/add_appointment.php">Add Appointment</a>
        </center>
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; Salvador & Aranzza 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- appointments form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/appointments_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

  </body>

</html>
