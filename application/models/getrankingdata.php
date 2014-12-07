<?php

 if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
 
 class getrankingdata extends CI_Model {
   
    public function __construct(){
        try{  parent::__construct(); }	catch(\PDOException $e){  echo $e->getMessage(); } //  END try
    } //END Funct
    
	 
	     
 
  //dbmodel
   public function getrankingByScoreData(){
        try{   
  
   	
			$ci=& get_instance(); 
			$ci->load->model('host');
			 
	 		// ENV
 			$this ->environment 	= isset($_SERVER['HTTP_HOST'])?$_SERVER['HTTP_HOST']:'localhost';   //Page user is on
			
			//var_dump($this->'server';
			 
	 		// DECLARE 	MYSQL HOST INFO
		    $this ->hostIP = "127.0.0.1";	// API
			$this ->id = 0;            		// id
			$this ->UserName= "root";  		// admin usr for db
		 	//DECLARE Default Params
		 	
		 	 
		 		/*	foreach ( $_POST as $var => $val)
		 			{
		 				$this -> $var 			= isset($_POST['$var'])?$_POST['$val']:"";   	 //Page user is on
		 			}
		 	   */
		 	
		 	// DECLARE SEARCH PARAM DEFAULTS
		 	$this -> page 			= isset($_POST['page'])?$_POST['page']:1;   	 //Page user is on
		 	$this -> rows 			= isset($_POST['rows'])?$_POST['rows']:10;  	//Number of Rows to display per page
		 	$this -> sidx 			= isset($_POST['sidx'])?$_POST['sidx']:"";  	//Sort Column
		 	$this -> sord 			= isset($_POST['sord'])?$_POST['sord']:"ASC";  //Sort Order
		 	$this -> nd 			= isset($_POST['nd'])?$_POST['nd']:0;    
		 	$this -> _search 		= isset($_POST['_search'])?$_POST['_search']:false;  		//Whether search is performed by user on data grid
		 	$this -> searchField 	= isset($_POST['searchField'])?$_POST['searchField']:"";  	//Field to perform Search on
		 	$this -> searchOper 	= isset($_POST['searchOper'])?$_POST['searchOper']:"";  	//Search Operator Short Form"
		 	$this -> searchString 	= isset($_POST['searchString'])?$_POST['searchString']:"";   //Search Text
		  
		  	$this -> arrUsers 	= array(); 
		    $this -> strMsg 	= "";
		    $this -> strMsgType 	= "success";
		    $this -> records 	= "";
		    $this -> blnSearch 	= "";
		    $this -> strMsg 	= false;
		    $this -> strSearch 	= "";
		    
		    
		    
		    
			 try{
	               //Production
	               //$this->_db = new PDO("mysql:dbname=ifwefoosball;host=$hostIP", "root", "$4@2@m!HW");
	               
	              // Development 
	              
	 			// 1.  DB connection
				 $this->_db = new PDO("mysql:dbname=ifwefoosball;host=$this->hostIP", "root", "");
	              //$this->_db = new PDO("mysql:dbname=ifwefoosball;host=$hostIP", "root", "");
        			//Debug
        			//echo("pdo connectiond done". "<br>");
        
	                     
		        // upddate record by
		         $update = (isset($_POST['oper']))?$_POST['oper'] : 0 ;

		 	    // upddate record by
		         $id = isset($_POST['ranking_ID'])?$_POST['ranking_ID'] : 0 ;
     			// upddate record by
		         $managerName = isset($_POST['ranking_ID'])?$_POST['ranking_ID'] : 0 ;
    
    			 $debug = isset($_GET['debug'])?$_GET['debug'] : 0 ;
   				  
  				 $this->load->helper('date');
  				//echo now('Australia/Victoria');
	             //$curdate = date(now());
	            //$curdate =date("Y-m-d");
	             
	            // print_r($curdate);
	             $curdate = "2014-6-12";
	              
			 	 //order by
		         $sidx = (isset($_POST['sidx']))?$_POST['sidx'] : 'id';
		        // sort by
		         $sord = (isset($_POST['sord']))?$_POST['sord'] : 'ASC';
 
 
 
				 $sql = $this->_db->prepare("  
									 select ranking_ID  , player,   playerScore , 
									 playerTotalGames   from ranking
									 group by player
									 order by   playerScore ASC
						");  /* 	 //{$sidx}   {$sord} */
						
						
				// 2. Execute		
				$sql->execute();
				
				// 3. GET Records
				$getRecords = $sql->fetchAll();
				//echo " no records ";   _search:false
				
				

  
     
 

		     	if ( isset($getRecords)  &&   is_array($getRecords)   ) {  
		        	 
		        	$foo = $getRecords;
					$bar = array();
					foreach ($foo as $f) {
					        //$f = trim($f);
					        foreach ($f as $k => $v) {
					        		$k = trim($k);
					        		$v = trim($v);
					                $bar[$k] = $v;
					        }
					}
					
					echo json_encode($foo)."\n";
					
					 

							/*
	$this->output
								 ->set_content_type('application/json')
						         ->set_output(json_encode($foo));
 
						          
 	
*/
		          }
		        else { echo " no records ";   }
							        
							    	                      
	        }catch(\PDOException $e){
	            echo $e->getMessage();
	        }
	    	 
	     
	    
		  } catch( Exception $e ) { return ($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString()); }  //CATCH END

     
    }// END FUNCTION
    
  	 	 
	  
}  // END ClASS

 