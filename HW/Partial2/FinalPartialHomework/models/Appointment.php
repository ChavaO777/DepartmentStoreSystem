<?php
    require_once("../db/Database.php");
    require_once("../interfaces/IAppointment.php");

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
    			$query = $this->con->prepare('INSERT INTO appointments (patient_id, must_be_rescheduled, date_time, created_at, updated_at, appointment_type_id, dentist_id) values (?,?,?,?,?,?,?)');
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

    	//obtenemos appointments de una tabla con postgreSql
    	public function get(){
    		try{
                if(is_int($this->id)){
                    
                    $query = $this->con->prepare('SELECT * FROM appointments WHERE id = ?');
                    $query->bindParam(1, $this->id, PDO::PARAM_INT);
                    $query->execute();
        			$this->con->close();
        			return $query->fetch(PDO::FETCH_OBJ);
                }
                else{
                    
                    $query = $this->con->prepare('SELECT * FROM appointments');
        			$query->execute();
        			$this->con->close();
                    
        			return $query->fetchAll(PDO::FETCH_OBJ);
                }
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

        public static function baseurl() {
             return stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'http://' . $_SERVER['HTTP_HOST'] . "/crudpgsql/";
        }

        public function checkAppointment($appointment) {
            if( ! $appointment ) {
                header("Location:" . User::baseurl() . "app/list.php");
            }
        }
    }
?>