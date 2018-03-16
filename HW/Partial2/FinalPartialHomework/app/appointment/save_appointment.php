<?php
	require_once "../../models/Appointment.php";
	if (empty($_POST['submit'])){
	      header("Location:" . Appointment::baseurl() . "index.php");
	      exit;
	}

	$args = array(
		'id'        => FILTER_VALIDATE_INT,
	    'patient_id'  => FILTER_SANITIZE_STRING,
	    'date_time'  => FILTER_SANITIZE_STRING,
	    'appointment_id'  => FILTER_SANITIZE_STRING,
	    'dentist_id'  => FILTER_SANITIZE_STRING,
	    'must_be_rescheduled'  => FILTER_SANITIZE_STRING,
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	$dt = new DateTime();

	$db = new Database;
	$appointment = new Appointment($db);
	$appointment->setPatientId($post->patient_id);
	$appointment->setMustBeRescheduled($post->must_be_rescheduled);
	$appointment->setDateTime($post->date_time);
	$appointment->setCreatedAt($dt->format('Y-m-d H:i:s'));
	$appointment->setUpdatedAt($dt->format('Y-m-d H:i:s'));
	$appointment->setAppointmentTypeId($post->appointment_id);
	$appointment->setDentistId($post->dentist_id);

	$appointment->save();
	header("Location:" . Appointment::baseurl() . "/index.php");

?>