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
        <div class="container">
            <div class="col-lg-12">
                <form action="<?php echo Appointment::baseurl() ?>/app/appointment/update_appointment.php" method="POST">
                    <center>
                        <div class="form-group">
                            <h2 class="section-heading text-uppercase" for="date_time">Date and time</h2>
                            <input type="text" style="width: 500px" name="date_time" value="<?php echo $appointment->date_time ?>" class="form-control text-center" id="date_time" placeholder="date_time">
                        </div>
                    </center>
                </form>
            </div>
        </div>
    </section>
</body>
</html>