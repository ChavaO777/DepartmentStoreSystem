<?php
    require_once "../../models/Appointment.php";
    
	$db = new Database;
	$user = new Appointment($db);
	$id = filter_input(INPUT_GET, 'appointment', FILTER_VALIDATE_INT);

	if( $id ){
		$user->setId($id);
		$user->deleteProductAppointment();
		$user->delete();
	}
	header("Location:" . Appointment::baseurl() . "/index.php");
?>