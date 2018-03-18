<?php

    require_once "../../models/Patient.php";
    
	$db = new Database;
	$user = new Patient($db);
	$id = filter_input(INPUT_GET, 'patient', FILTER_VALIDATE_INT);

	if( $id ){
		$user->setId($id);
		$user->deleteProductAppointment();
		$user->deleteAppointment();
		$user->delete();
	}
	header("Location:" . Patient::baseurl() . "/index.php");
?>