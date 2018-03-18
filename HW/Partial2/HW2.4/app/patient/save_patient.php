<?php
	require_once "../../models/Patient.php";
	if (empty($_POST['submit'])){
	      header("Location:" . Patient::baseurl() . "/index.php");
	      exit;
	}

	$args = array(
	    'id'        => FILTER_VALIDATE_INT,
	    'firstname'  => FILTER_SANITIZE_STRING,
	    'lastname'  => FILTER_SANITIZE_STRING,
	    'birthdate'  => FILTER_SANITIZE_STRING,
	    'email'  => FILTER_SANITIZE_STRING,
	    'cellphone'  => FILTER_VALIDATE_INT,
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	$dt = new DateTime();

	$db = new Database;
	$patient = new Patient($db);
	$patient->setId($post->id);
	$patient->setFirstName($post->firstname);
	$patient->setLastName($post->lastname);
	$patient->setBirthdate($post->birthdate);
	$patient->setEmail($post->email);
	$patient->setCellphone($post->cellphone);
	$patient->setCreatedAt($dt->format('Y-m-d H:i:s'));
	$patient->update();
	$patient->save();
	header("Location:" . Patient::baseurl() . "/index.php");

?>