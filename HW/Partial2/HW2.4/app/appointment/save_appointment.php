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
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	$dt = new DateTime();

	$db = new Database;
	$appointment = new Appointment($db);

	$appointment->setPatientId($post->patient_id);
	//Hardcoded value; it makes no sense to have to reschedule it just after its creation
	// $appointment->setMustBeRescheduled(false); 
	$appointment->setDateTime($post->date_time);
	$appointment->setCreatedAt($dt->format('Y-m-d H:i:s'));
	$appointment->setUpdatedAt($dt->format('Y-m-d H:i:s'));
	$appointment->setAppointmentTypeId($post->appointment_id);
	$appointment->setDentistId($post->dentist_id);

	if($appointment->validatePatient() AND 
	   $appointment->validateAppointmentType() AND 
	   $appointment->validateDentist() AND 
	   $appointment->validateDentistDateTime() AND 
	   $appointment->validatePatientDateTime() AND 
	   $appointment->computeAppointmentsOfSubjectInTimeInterval(false) AND 
	   $appointment->computeAppointmentsOfSubjectInTimeInterval(true) AND 
	   $appointment->computeAppointmentsThatStartBefore(true) AND 
	   $appointment->computeAppointmentsThatStartBefore(false)){

		$appointment->save();
		header("Location:" . Appointment::baseurl() . "/index.php");
	}
	else{
		header("Location:" . Appointment::baseurl() . "/error.php");
	}
?>