<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Orthodontics office</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" media="screen" title="no title" charset="utf-8">
    </head>
    <body>

        <!-- Dentists Section -->

        <?php
            require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Dentist.php";
            $db = new Database;
            $dentist = new Dentist($db);
            $dentists = $dentist->get();        
        ?>

        <h1 align="center">Orthodontics office</h1>

        <div class="container">
            <div class="col-lg-12">
                <h2 class="text-center text-primary">Dentists List</h2>
                <!-- <div class="col-lg-1 pull-right" style="margin-bottom: 10px">
                    <a class="btn btn-info" href="<?php //echo Dentist::baseurl() ?>/app/addDentist.php">Add dentist</a>
                </div> -->
                <?php
                if( ! empty( $dentists ) ) {
                ?>
                <table class="table table-striped">
                    <tr>
                        <th>Id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Cellphone</th>
                        <th>Email</th>
                        <th>Birthdate</th>
                        <th>Start date</th>
                        <th>Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <?php foreach( $dentists as $dentist )
                    {
                    ?>
                        <tr>
                            <td><?php echo $dentist->id ?></td>
                            <td><?php echo $dentist->first_name ?></td>
                            <td><?php echo $dentist->last_name ?></td>
                            <td><?php echo $dentist->cellphone ?></td>
                            <td><?php echo $dentist->email ?></td>
                            <td><?php echo $dentist->birthdate ?></td>
                            <td><?php echo $dentist->start_date ?></td>
                            <td><?php echo $dentist->status ?></td>
                            
                            <td>
                                <a class="btn btn-info" href="<?php echo Dentist::baseurl() ?>app/editDentist.php?dentist=<?php echo $dentist->id ?>">Edit</a> 
                            </td>
                            <td>
                                <a class="btn btn-info" href="<?php echo Dentist::baseurl() ?>app/deleteDentist.php?dentist=<?php echo $dentist->id ?>">Delete</a>
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
                <div class="alert alert-danger" style="margin-top: 100px">There are 0 registered dentists</div>
                <?php
                }
                ?>
            </div>
        </div>

        <!-- Patients Section -->

        <?php
            require_once $_SERVER['DOCUMENT_ROOT'] . "/models/Patient.php";
            $db = new Database;
            $patient = new Patient($db);
            $patients = $patient->get();        
        ?>

        <div class="container">
            <div class="col-lg-12">
                <h2 class="text-center text-primary">Patients List</h2>
                <div class="col-lg-1 pull-right" style="margin-bottom: 10px">
                    <a class="btn btn-info" href="<?php echo Patient::baseurl() ?>/app/addPatient.php">Add patient</a>
                </div>
                <?php
                if( ! empty( $patients ) ) {
                ?>
                <table class="table table-striped">
                    <tr>
                        <th>Id</th>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Birthdate</th>
                        <th>Created at</th>
                        <th>Email</th>
                        <th>Cellphone</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <?php foreach( $patients as $patient )
                    {
                    ?>
                        <tr>
                            <td><?php echo $patient->id ?></td>
                            <td><?php echo $patient->first_name ?></td>
                            <td><?php echo $patient->last_name ?></td>
                            <td><?php echo $patient->birthdate ?></td>
                            <td><?php echo $patient->created_at ?></td>
                            <td><?php echo $patient->email ?></td>
                            <td><?php echo $patient->cellphone ?></td>
                            
                            <td>
                                <a class="btn btn-info" href="<?php echo Patient::baseurl() ?>app/editPatient.php?dentist=<?php echo $patient->id ?>">Edit</a> 
                            </td>
                            <td>
                                <a class="btn btn-info" href="<?php echo Patient::baseurl() ?>app/deletePatient.php?dentist=<?php echo $patient->id ?>">Delete</a>
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
        
    </body>
</html>