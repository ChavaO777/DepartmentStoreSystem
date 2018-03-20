<?php
	require_once "../../models/Appointment.php";
	if (empty($_POST['submit'])){
	      header("Location:" . Appointment::baseurl() . "/index.php");
	      exit;
	}
	$args = array(
	    'id'        => FILTER_VALIDATE_INT,
	    'date_time' => FILTER_SANITIZE_STRING,
	    'patient_id'  => FILTER_VALIDATE_INT,
	    'appointment_id' => FILTER_VALIDATE_INT,
	    'dentist_id' => FILTER_VALIDATE_INT,
	    'must_be_rescheduled' => FILTER_SANITIZE_STRING,
	);

	// echo $post->dentist_id;

	$post = (object)filter_input_array(INPUT_POST, $args);

	if( $post->id === false ){
	    header("Location:" . Appointment::baseurl() . "index.php");
	}

	$db = new Database;
	$dt = new DateTime();

	$appointment = new Appointment($db);
	$appointment->setId($post->id);
	$appointment->setPatientId($post->patient_id);
	$appointment->setDentistId($post->dentist_id);
	$appointment->setMustBeRescheduled($post->must_be_rescheduled);
	$appointment->setDateTime($post->date_time);
	$appointment->setUpdatedAt($dt->format('Y-m-d H:i:s'));
	$appointment->setAppointmentTypeId($post->appointment_id);

	if($appointment->validatePatient() AND $appointment->validateAppointmentType() AND $appointment->validateDentist() AND $appointment->validateDentistDateTime() AND $appointment->validatePatientDateTime() AND $appointment->computeAppointmentsOfSubjectInTimeInterval(false) AND $appointment->computeAppointmentsOfSubjectInTimeInterval(true) AND $appointment->computeAppointmentsThatStartBefore(true) AND $appointment->computeAppointmentsThatStartBefore(false)){

		$appointment->update();
		header("Location:" . Appointment::baseurl() . "/index.php");
	}
	else{
		header("Location:" . Appointment::baseurl() . "/error.php");
	}
	// header("Location:" . Patient::baseurl() . "/index.php");
?>
<!-- <script type="text/javascript">
	window.location="../../index.php";
</script> -->