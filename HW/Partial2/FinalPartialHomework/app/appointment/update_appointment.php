<?php
	require_once "../../models/Appointment.php";
	if (empty($_POST['submit'])){
	      header("Location:" . Appointment::baseurl() . "/index.php");
	      exit;
	}
	$args = array(
	    'id'        => FILTER_VALIDATE_INT,
	    'date_time' => FILTER_SANITIZE_STRING,
	    'patient_firstname'  => FILTER_SANITIZE_STRING,
	    'patient_lastname'  => FILTER_SANITIZE_STRING,
	    'appointment_type'  => FILTER_SANITIZE_STRING,
	    'dentist_firstname'  => FILTER_SANITIZE_STRING,
	    'dentist_lastname'  => FILTER_SANITIZE_STRING,
	    'must_be_rescheduled' => FILTER_VALIDATE_INT,
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	if( $post->id === false ){
	    header("Location:" . Appointment::baseurl() . "index.php");
	}

	$db = new Database;
	$patient = new Patient($db);
	$patient->setId($post->id);
	$patient->setFirstName($post->firstname);
	$patient->setLastName($post->lastname);
	$patient->setBirthdate($post->birthdate);
	$patient->setEmail($post->email);
	$patient->setCellphone($post->cellphone);
	$patient->setCreatedAt($post->createdAt);
	$patient->update();
	// header("Location:" . Patient::baseurl() . "/index.php");
?>
<script type="text/javascript">
	window.location="../../index.php";
</script>