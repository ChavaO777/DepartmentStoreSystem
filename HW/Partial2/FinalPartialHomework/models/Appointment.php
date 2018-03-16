<?php
    require_once($_SERVER['DOCUMENT_ROOT'] . "/db/Database.php");
    require_once($_SERVER['DOCUMENT_ROOT'] . "/interfaces/IAppointment.php");

    class Appointment implements IAppointment {
    	private $con;
        private $id;
        private $patientId;
        private $mustBeRescheduled;
        private $dateTime;
        private $createdAt;
        private $updatedAt;
        private $appointmentTypeId;
        private $dentistId;

    	public function __construct(Database $db){
    		$this->con = new $db;
    	}

        public function setId($id){
            $this->id = $id;
        }

        public function setPatientId($patientId){
            $this->patientId = $patientId;
        }

        public function setDentistId($dentistId){
            $this->dentistId = $dentistId;
        }

        public function setMustBeRescheduled($mustBeRescheduled){
            $this->mustBeRescheduled = $mustBeRescheduled;
        }

        public function setDateTime($dateTime){
            $this->dateTime = $dateTime;
        }

        public function setCreatedAt($createdAt){
            $this->createdAt = $createdAt;
        }

        public function setUpdatedAt($updatedAt){
            $this->updatedAt = $updatedAt;
        }

        public function setAppointmentTypeId($appointmentTypeId){
            $this->appointmentTypeId = $appointmentTypeId;
        }

    	//insertamos usuarios en una tabla con postgreSql
    	public function save() {
    		try{

                $query = $this->con->prepare('INSERT INTO appointments VALUES(DEFAULT, ?,?,?,?,?,?,?)');

                $query->bindParam(1, $this->patientId, PDO::PARAM_STR);
                $query->bindParam(2, $this->mustBeRescheduled, PDO::PARAM_STR);
                $query->bindParam(3, $this->dateTime, PDO::PARAM_STR);
                $query->bindParam(4, $this->createdAt, PDO::PARAM_STR);
                $query->bindParam(5, $this->updatedAt, PDO::PARAM_STR);
                $query->bindParam(6, $this->appointmentTypeId, PDO::PARAM_STR);
                $query->bindParam(7, $this->dentistId, PDO::PARAM_STR);

    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e) {
    	        echo  $e->getMessage();
    	    }
    	}

        public function update(){
    		try{
    			$query = $this->con->prepare('UPDATE appointments SET patient_id = ?, must_be_rescheduled = ?, date_time = ?, created_at = ?, updated_at = ?, appointment_type_id = ?, dentist_id = ? WHERE id = ?');
                $query->bindParam(1, $this->patientId, PDO::PARAM_STR);
                $query->bindParam(2, $this->mustBeRescheduled, PDO::PARAM_STR);
                $query->bindParam(3, $this->dateTime, PDO::PARAM_STR);
                $query->bindParam(4, $this->createdAt, PDO::PARAM_STR);
                $query->bindParam(5, $this->updatedAt, PDO::PARAM_STR);
                $query->bindParam(6, $this->appointmentTypeId, PDO::PARAM_STR);
                $query->bindParam(7, $this->dentistId, PDO::PARAM_STR);
                $query->bindParam(8, $this->id, PDO::PARAM_INT);
    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
    	}

        public function getPatientNames(){

            try{
                $query = $this->con->prepare('SELECT id AS p_id, first_name AS p_firstname, last_name AS p_lastname FROM patients');
                $query->execute();
                $this->con->close();
                
                return $query->fetchAll(PDO::FETCH_OBJ);
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function getAppointmentNames(){

            try{
                $query = $this->con->prepare('SELECT id AS app_id, description AS app_name FROM appointment_types');
                $query->execute();
                $this->con->close();
                
                return $query->fetchAll(PDO::FETCH_OBJ);
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function getDentistNames(){

            try{
                $query = $this->con->prepare('SELECT id AS d_id, first_name AS d_firstname, last_name AS d_lastname FROM dentists');
                $query->execute();
                $this->con->close();
                
                return $query->fetchAll(PDO::FETCH_OBJ);
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

    	//obtenemos appointments de una tabla con postgreSql
    	public function get(){
    		try{
                if(is_int($this->id)){
                    
                    $query = $this->con->prepare('SELECT app.id AS id, app.date_time AS date_time, p.id AS p_id, p.first_name AS p_firstname, p.last_name AS p_lastname, appt.id AS appt_id, appt.description AS description, d.first_name AS d_firstname, d.id AS d_id, d.last_name AS d_lastname, app.must_be_rescheduled AS must_be_rescheduled FROM appointments app, patients p, appointment_types appt, dentists d WHERE app.patient_id = p.id AND app.appointment_type_id = appt.id AND app.dentist_id = d.id AND app.id = ?');
                    $query->bindParam(1, $this->id, PDO::PARAM_INT);
                    $query->execute();
        			$this->con->close();
        			return $query->fetch(PDO::FETCH_OBJ);
                }
                else{
                    
                    $query = $this->con->prepare('SELECT p.id AS p_id, app.id AS id, p.first_name AS p_firstname, appt.id AS appt_id, p.last_name AS p_lastname, app.date_time AS date_time, appt.description AS description, d.first_name AS d_firstname, d.id AS d_id, d.last_name AS d_lastname, app.must_be_rescheduled AS must_be_rescheduled from patients p, appointments app, appointment_types appt, dentists d WHERE p.id = app.patient_id AND appt.id = app.appointment_type_id AND d.id = app.dentist_id');
        			$query->execute();
        			$this->con->close();
                    
        			return $query->fetchAll(PDO::FETCH_OBJ);
                }
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
        }
        
    	public function getTodaysAppointments(){
    		try{
                $query = $this->con->prepare("SELECT a.id, a.must_be_rescheduled, a.date_time, p.first_name AS patient_first_name, p.last_name AS patient_last_name, at.description, d.first_name AS dentist_first_name, d.last_name AS dentist_last_name FROM appointments a JOIN patients p ON p.id = a.patient_id JOIN appointment_types at ON a.appointment_type_id = at.id JOIN dentists d ON d.id = a.dentist_id WHERE date_time::date = current_date");
                $query->execute();
                $this->con->close();
                
                return $query->fetchAll(PDO::FETCH_OBJ);
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
        }
        
        /**
         * Function to get the appointments in a given range of dates
         * 
         * @param $prevDateStr a string corresponding to the earliest date in the range
         * @param $nextDateStr a string corresponding to the latest date in the range
         * @return a result set with the appointments in that range
         */
    	public function getAppointmentsInDateRange($prevDateStr, $nextDateStr){
    		try{    
                
                $prevDateTime = new DateTime();
                $prevDate = $prevDateTime->createFromFormat('d/m/Y', $prevDateStr);

                $nextDateTime = new DateTime();
                $nextDate = $nextDateTime->createFromFormat('d/m/Y', $nextDateStr);

                // $prevDate = date_create($prevDateStr);
                // $nextDate = date_create($nextDateStr);

                $sql_query = "SELECT a.id, a.must_be_rescheduled, a.date_time, p.first_name AS patient_first_name, p.last_name AS patient_last_name, at.description, d.first_name AS dentist_first_name, d.last_name AS dentist_last_name FROM appointments a JOIN patients p ON p.id = a.patient_id JOIN appointment_types at ON a.appointment_type_id = at.id JOIN dentists d ON d.id = a.dentist_id WHERE date_time::date >= $prevDate AND date_time::date <= $nextDate";
                // $sql_query = "SELECT a.id, a.must_be_rescheduled, a.date_time, p.first_name AS patient_first_name, p.last_name AS patient_last_name, at.description, d.first_name AS dentist_first_name, d.last_name AS dentist_last_name FROM appointments a JOIN patients p ON p.id = a.patient_id JOIN appointment_types at ON a.appointment_type_id = at.id JOIN dentists d ON d.id = a.dentist_id";

                $query = $this->con->prepare($sql_query);
                $query->execute();
                $this->con->close();
                
                return $query->fetchAll(PDO::FETCH_OBJ);
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
    	}

        public function deleteProductAppointment(){

            try{
                $query = $this->con->prepare('DELETE FROM product_appointment WHERE appointment_id = ?');
                $query->bindParam(1, $this->id, PDO::PARAM_INT);
                $query->execute();
                $this->con->close();
                return true;
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }            
        }

        public function delete(){
            try{
                $query = $this->con->prepare('DELETE FROM appointments WHERE id = ?');
                $query->bindParam(1, $this->id, PDO::PARAM_INT);
                $query->execute();
                $this->con->close();
                return true;
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function validatePatient(){

            try{

                $query = $this->con->prepare('SELECT id FROM patients WHERE id = ?');
                $query->bindParam(1, $this->patientId, PDO::PARAM_INT);
                $query->execute();
                $count = $query->rowCount();

                $this->con->close();

                if($count == 0){
                    return false;
                }
                else {
                    return true;
                }


            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function validateAppointmentType(){

            try{

                $query = $this->con->prepare('SELECT id FROM appointment_types WHERE id = ?');
                $query->bindParam(1, $this->appointmentTypeId, PDO::PARAM_INT);
                $query->execute();
                $count = $query->rowCount();

                $this->con->close();

                if($count == 0){
                    return false;
                }
                else {
                    return true;
                }                
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function validateDentist(){

            try{

                $query = $this->con->prepare('SELECT id FROM dentists WHERE id = ?');
                $query->bindParam(1, $this->dentistId, PDO::PARAM_INT);
                $query->execute();
                $count = $query->rowCount();

                $this->con->close();

                if($count == 0){
                    return false;
                }
                else {
                    return true;
                }
            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function validatePatientDateTime(){

            try{

                $query = $this->con->prepare('SELECT date_time FROM appointments, patients WHERE appointments.date_time = ? AND patients.id = ?');
                $query->bindParam(1, $this->dateTime, PDO::PARAM_INT);
                $query->bindParam(1, $this->patientId, PDO::PARAM_INT);
                $query->execute();
                $count = $query->rowCount();

                $this->con->close();

                if($count >= 0){
                    return false;
                }
                else {
                    return true;
                }

            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public function validateAppointmentTime(){

            $query = $this->con->prepare('SELECT minutes FROM appointment_types appt, appointments app WHERE app.appointment_type_id = appt.id AND appt.id = ?');
            $query->bindParam(1, $this->appointmentTypeId, PDO::PARAM_INT);
            $query->execute();
            $minutes = $query->fetch(PDO::FETCH_OBJ);

            $totalTime = $dateTime::time + $minutes;

            $queryTime = $this->con->prepare('SELECT id FROM appointments WHERE date_time >= ?');
            $queryTime->bindParam(1, $totalTime, PDO::PARAM_INT);
            $queryTime->execute();
            $count = $queryTime->rowCount();

            $this->con->close();

            if($count == 0){
                return true;
            }
            else {
                return false;
            }

        }

        public function validateDentistDateTime(){

            try{

                $query = $this->con->prepare('SELECT date_time FROM appointments, dentists WHERE appointments.date_time = ? AND dentists.id = ?');
                $query->bindParam(1, $this->dateTime, PDO::PARAM_INT);
                $query->bindParam(1, $this->dentistId, PDO::PARAM_INT);
                $query->execute();
                $count = $query->rowCount();

                $this->con->close();

                if($count >= 0){
                    return false;
                }
                else {
                    return true;
                }

            }
            catch(PDOException $e){
                echo  $e->getMessage();
            }
        }

        public static function baseurl() {
             return stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'http://' . $_SERVER['HTTP_HOST'];
        }

        public function checkAppointment($appointment) {
            if( ! $appointment ) {
                header("Location:" . Appointment::baseurl() . "/index.php");
            }
        }
    }
?>