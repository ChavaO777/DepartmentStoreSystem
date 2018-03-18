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
	    'createdAt' => FILTER_SANITIZE_STRING,
	);

	$post = (object)filter_input_array(INPUT_POST, $args);

	var_dump($post->id);
	if( $post->id === false ){
	    header("Location:" . Patient::baseurl() . "index.php");
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