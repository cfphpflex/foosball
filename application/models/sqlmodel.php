<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class sqlmodel extends CI_Model {
 
    protected $_db = null;
    protected $_id;
    protected $_data;
 
    //CONSTRUCT     
	/*     function __construct() {  parent::__construct();  } */
   
    public function __construct(){
        try{  parent::__construct();
             
        }catch(\PDOException $e){
            echo $e->getMessage();
        }
     
    } // END CONSTRUCT
    
    
 
  //dbmodel
   public function dbmodel(){
        try{   
  
				$ci=& get_instance(); 
				$ci->load->model('host');
				$myHost = $ci->host->myhost();  // inst. above function_exists(string function_name)
				
				// IF what SERVER???  Dev or STAGE or Prod
 				if (  $myHost['localhost']  == 'http://localhost'  )
 				     { 	$db =  new PDO("mysql:dbname=hrportal;host=127.0.0.1", "root", "");	  return $db;	}  // DEV & STAGE SSERVER
 				else {  
 						$db =  new \PDO("mysql:dbname=hrportal;host=localhost", "root", "$4@2@m!HW");  return $db; 
 					 }  //PRODUCTION SERVER
    			//END IF
		  } catch( Exception $e ) { return ($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString()); }  //CATCH END

     
    }// END FUNCTION
    
 
	// START SQL CONN, STMT PREP, EXECUTE, FETCH, RETURN RECORDS
	public function  getallrecordsmodel ($SQL) {
		try {
			$ci=& get_instance(); 
			$ci->load->model('host');
			$myHost = $ci->host->myhost();  // inst. above function_exists(string function_name)
	        $db = $this->dbmodel();
	      
			$sql = $db->prepare($SQL);				// 2. PREP SQL STMT			
			$sql->execute();  						// 3. Execute SQL STME	
			$getallrecords = $sql->fetchAll();  		// 4. GET Records	
			return $getallrecords;  					// 5. RETURN ALL RECORDS
						 
		  } catch( Exception $e ) { return ($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString()); }  //CATCH END
 
	}  // END FUNCTION
	 	 
	  
}  // END ClASS

 