<?php
    require_once($_SERVER['DOCUMENT_ROOT'] . "/db/Database.php");
    require_once($_SERVER['DOCUMENT_ROOT'] . "/interfaces/IPatient.php");

    class Patient implements IPatient {
    	private $con;
        private $id;
        private $firstName;
        private $lastName;
        private $birthdate;
        private $createdAt;
        private $email;
        private $cellphone;

    	public function __construct(Database $db){
    		$this->con = new $db;
    	}

        public function setId($id){
            $this->id = $id;
        }

        public function setFirstName($firstName){
            $this->firstName = $firstName;
        }

        public function setLastName($lastName){
            $this->lastName = $lastName;
        }

        public function setBirthdate($birthdate){
            $this->birthdate = $birthdate;
        }

        public function setCreatedAt($createdAt){
            $this->createdAt = $createdAt;
        }

        public function setEmail($email){
            $this->email = $email;
        }

        public function setCellphone($cellphone){
            $this->cellphone = $cellphone;
        }

    	//insertamos pacientes en una tabla con postgreSql
    	public function save() {
    		try{
    			$query = $this->con->prepare('INSERT INTO patients (first_name, last_name, birthdate, created_at, email, cellphone) values (?,?,?,?,?,?)');
                $query->bindParam(1, $this->firstName, PDO::PARAM_STR);
                $query->bindParam(2, $this->lastName, PDO::PARAM_STR);
                $query->bindParam(3, $this->birthdate, PDO::PARAM_STR);
                $query->bindParam(4, $this->createdAt, PDO::PARAM_STR);
                $query->bindParam(5, $this->email, PDO::PARAM_STR);
                $query->bindParam(6, $this->cellphone, PDO::PARAM_STR);
    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e) {
    	        echo  $e->getMessage();
    	    }
    	}

        public function update(){
    		try{
    			$query = $this->con->prepare('UPDATE patients SET first_name = ?, last_name = ?, birthdate = ?, created_at = ?, email = ?, cellphone = ? WHERE id = ?');
                $query->bindParam(1, $this->firstName, PDO::PARAM_STR);
                $query->bindParam(2, $this->lastName, PDO::PARAM_STR);
                $query->bindParam(3, $this->birthdate, PDO::PARAM_STR);
                $query->bindParam(4, $this->createdAt, PDO::PARAM_STR);
                $query->bindParam(5, $this->email, PDO::PARAM_STR);
                $query->bindParam(6, $this->cellphone, PDO::PARAM_STR);
                $query->bindParam(7, $this->id, PDO::PARAM_INT);
    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
    	}

    	//obtenemos pacientes de una tabla con postgreSql
    	public function get(){
    		try{
                if(is_int($this->id)){
                    
                    $query = $this->con->prepare('SELECT * FROM patients WHERE id = ?');
                    $query->bindParam(1, $this->id, PDO::PARAM_INT);
                    $query->execute();
        			$this->con->close();
        			return $query->fetch(PDO::FETCH_OBJ);
                }
                else{
                    
                    $query = $this->con->prepare('SELECT * FROM patients');
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
                $query = $this->con->prepare('DELETE FROM patients WHERE id = ?');
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
             return stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'http://' . $_SERVER['HTTP_HOST'];
        }

        public function checkPatient($patient) {
            if( ! $patient ) {
                header("Location:" . Patient::baseurl() . "index.php");
            }
        }
    }
?>