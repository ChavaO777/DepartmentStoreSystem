<?php
    require_once("../db/Database.php");
    require_once("../interfaces/IDentist.php");

    class Dentist implements IDentist {
    	private $con;
        private $id;
        private $firstName;
        private $lastName;
        private $cellphone;
        private $email;
        private $birthdate;
        private $startDate;
        private $status;

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

        public function setCellPhone($cellphone){
            $this->cellphone = $cellphone;
        }

        public function setEmail($email){
            $this->email = $email;
        }

        public function setBirthdate($birthdate){
            $this->birthdate = $birthdate;
        }

        public function setStartDate($startDate){
            $this->startDate = $startDate;
        }

        public function setStatus($status){
            $this->status = $status;
        }

    	//insertamos dentistas en una tabla con postgreSql
    	public function save() {
    		try{
    			$query = $this->con->prepare('INSERT INTO dentists (first_name, last_name, cellphone, email, birthdate, start_date, status) values (?,?,?,?,?,?,?)');
                $query->bindParam(1, $this->firstName, PDO::PARAM_STR);
                $query->bindParam(2, $this->lastName, PDO::PARAM_STR);
                $query->bindParam(3, $this->cellphone, PDO::PARAM_STR);
                $query->bindParam(4, $this->email, PDO::PARAM_STR);
                $query->bindParam(5, $this->birthdate, PDO::PARAM_STR);
                $query->bindParam(6, $this->startDate, PDO::PARAM_STR);
                $query->bindParam(7, $this->status, PDO::PARAM_STR);
    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e) {
    	        echo  $e->getMessage();
    	    }
    	}

        public function update(){
    		try{
    			$query = $this->con->prepare('UPDATE dentists SET first_name = ?, last_name = ?, cellphone = ?, email = ?, birthdate = ?, start_date = ?, status = ? WHERE id = ?');
    			$query->bindParam(1, $this->firstName, PDO::PARAM_STR);
                $query->bindParam(2, $this->lastName, PDO::PARAM_STR);
                $query->bindParam(3, $this->cellphone, PDO::PARAM_STR);
                $query->bindParam(4, $this->email, PDO::PARAM_STR);
                $query->bindParam(5, $this->birthdate, PDO::PARAM_STR);
                $query->bindParam(6, $this->startDate, PDO::PARAM_STR);
                $query->bindParam(7, $this->status, PDO::PARAM_STR);
                $query->bindParam(8, $this->id, PDO::PARAM_INT);
    			$query->execute();
    			$this->con->close();
    		}
            catch(PDOException $e){
    	        echo  $e->getMessage();
    	    }
    	}

    	//obtenemos dentistas de una tabla con postgreSql
    	public function get(){
    		try{
                if(is_int($this->id)){
                    
                    $query = $this->con->prepare('SELECT * FROM dentists WHERE id = ?');
                    $query->bindParam(1, $this->id, PDO::PARAM_INT);
                    $query->execute();
        			$this->con->close();
        			return $query->fetch(PDO::FETCH_OBJ);
                }
                else{
                    
                    $query = $this->con->prepare('SELECT * FROM dentists');
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
                $query = $this->con->prepare('DELETE FROM dentists WHERE id = ?');
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

        public function checkDentist($dentist) {
            if( ! $dentist ) {
                header("Location:" . User::baseurl() . "app/list.php");
            }
        }
    }
?>