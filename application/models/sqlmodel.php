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
   public function dbconnection(){
        try{   
  
			$ci=& get_instance(); 
			$ci->load->model('host');
					 
	 		// DECLARE 	MYSQL HOST INFO
		    $this ->hostIP = "127.0.0.1";	// API
			$this ->id = 0;            		// id
			$this ->UserName= "root";  		// admin usr for dba_close(
		
			$myHost = $ci->host->myhost();  // inst. above function_exists(string function_name)
			
			// IF what SERVER???  Dev or STAGE or Prod
			if (  $myHost['localhost']  == 'http://localhost'  )
				     { 	$db =  new PDO("mysql:dbname=ifwefoosball;host=$this->hostIP", "root", "");	  return $db;	}  // DEV & STAGE SSERVER
				else {  
						$db =  new PDO("mysql:dbname=ifwefoosball;host=$this->hostIP", "root", "");  return $db; 
					 }  //PRODUCTION SERVER
			//END IF
		  } catch( Exception $e ) { return ($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString()); }  //CATCH END

     
    }// END FUNCTION
    
  
	  
}  // END ClASS

 