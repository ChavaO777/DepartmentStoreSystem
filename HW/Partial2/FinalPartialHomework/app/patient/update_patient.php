<?php
	require_once "../models/Patient.php";
	if (empty($_POST['submit'])){
	      header("Location:" . Patient::baseurl() . "index.php");
	      exit;
	}
	$args = array(
	    'id'        => FILTER_VALIDATE_INT,
	    'username'  => FILTER_SANITIZE_STRING,
	    'password'  => FILTER_SANITIZE_STRING,
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	if( $post->id === false ){
	    header("Location:" . Patient::baseurl() . "index.php");
	}

	$db = new Database;
	$patient = new Patient($db);
	$patient->setId($post->id);
	$patient->setUsername($post->username);
	$patient->setPassword($post->password);
	$patient->update();
	header("Location:" . Dentist::baseurl() . "index.php");
?>