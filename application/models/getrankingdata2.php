<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
class getrankingdata extends CI_Model {
 
  
 
    //CONSTRUCT     
	/*     function __construct() {  parent::__construct();  } */
   
    public function __construct(){
        try{  parent::__construct();
             
        }catch(\PDOException $e){
            echo $e->getMessage();
        }
     
    } // END CONSTRUCT
    
    
 
  //dbmodel
   public function getrankindata(){
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
	               //$this->_db = new PDO("mysql:dbname=hrportal;host=$hostIP", "root", "$4@2@m!HW");
	               
	              // Development 
	              
	 			// 1.  DB connection
				 $this->_db = new PDO("mysql:dbname=hrportal;host=$this->hostIP", "root", "");
	              //$this->_db = new PDO("mysql:dbname=hrportal;host=$hostIP", "root", "");
        			//Debug
        			//echo("pdo connectiond done". "<br>");
        
	                     
		        // upddate record by
		         $update = (isset($_POST['oper']))?$_POST['oper'] : 0 ;

		 	    // upddate record by
		          $id = isset($_POST['id'])?$_POST['id'] : 0 ;
     			// upddate record by
		          $managerName = isset($_POST['manager_name_vc'])?$_POST['manager_name_vc'] : 0 ;
    
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
 
 
 

   				 
//************* DEFAULT  GET  ALL RECORDS   
	 			if( isset($_POST['_search'])  &&    $_POST['_search'] === 'false'   )   { 
	  	
					// 1. SQL stmnt

 
						$sql = $this->_db->prepare("  select ranking_ID  ,  playerScore , 
						 playerTotalGames , playerHighestScore  from ranking
						 group by player
						 order by   playerScore ASC
						         ");    
/* 			     //{$sidx}   {$sord} */
					// 2. Execute		
					   	$sql->execute();

		            // 3. GET Records
		            	$getRecords = $sql->fetchAll();
					//echo " no records ";   _search:false

						
				}
//*************END UPDATE

  
  
   
  
  
  			  
   				 
//************* UPDATE RECORDS  
	 			if( isset($_POST['oper'])  &&    $_POST['oper'] === 'del'   )   { 
	  				
	  					$this 	-> 	fname 		= isset($_POST['fname'])?$_POST['fname']:"none";   	 //Page user is on
		  					//print_r($this->fname);
		  				$this 	-> 	lname 		= isset($_POST['lname'])?$_POST['lname']:"none";   	 //Page user is on
		  					//print_r($this->lname);
						$this 	-> 	title 		= isset($_POST['title'])?$_POST['title']:"none";   	 //Page user is on
							//print_r($this->title);
		  				$this 	-> 	manager 	= isset($_POST['manager'])?$_POST['manager']:"none";   	 //Page user is on
		  					//print_r($this->manager);
						$this 	-> 	department 	= isset($_POST['department'])?$_POST['department']:"none";   	 //Page user is on
							//print_r($this->department);
		  				 
		  				$this 	-> 	status2 	= isset($_POST['status2'])?$_POST['status2']:"none";   	 //Page user is onprint_r($this->lname);
		  					//print_r($this->status2);
						$this 	-> 	id 			= isset($_POST['id'])?$_POST['id']:0;   	 		 //Page user is on
						
						
	  				// 1. SQL stmnt
						$sql = $this->_db->prepare("  UPDATE new_hires 
												        SET   status2 = 'New Hire Deleted'
														WHERE id      = ?     ");    
			     
					// 2. Execute	 
					   	$sql->execute(array( $_POST['id'] ));
					   	
				 
					// 3. SQL stmnt
						$sql2 = $this->_db->prepare("select id, fname , lname, title, manager, department, start_date, contractor, status2 from new_hires    where start_date < '{$curdate}'  and   status2 != 'New Hire'  order by {$sidx}   {$sord}  ");    
			     
					// 4. Execute		
					   	$sql2->execute();

		            // 5. GET Records
		            	$getRecords = $sql2->fetchAll();
					//echo " no records ";   _search:false

 		
				}
//*************END UPDATE

  
   		 			
   		 				  
   				 
   		 				  
   				 
//************* UPDATE RECORDS  
	 			if( isset($_POST['oper'])  &&    $_POST['oper'] === 'edit'   )   { 
	  				
	  					$this 	-> 	fname 		= isset($_POST['fname'])?$_POST['fname']:"none";   	 //Page user is on
		  					//print_r($this->fname);
		  				$this 	-> 	lname 		= isset($_POST['lname'])?$_POST['lname']:"none";   	 //Page user is on
		  					//print_r($this->lname);
						$this 	-> 	title 		= isset($_POST['title'])?$_POST['title']:"none";   	 //Page user is on
							//print_r($this->title);
		  				$this 	-> 	manager 	= isset($_POST['manager'])?$_POST['manager']:"none";   	 //Page user is on
		  					//print_r($this->manager);
						$this 	-> 	department 	= isset($_POST['department'])?$_POST['department']:"none";   	 //Page user is on
							//print_r($this->department);
		  				 
		  				$this 	-> 	status2 	= isset($_POST['status2'])?$_POST['status2']:"none";   	 //Page user is onprint_r($this->lname);
		  					//print_r($this->status2);
						$this 	-> 	id 			= isset($_POST['id'])?$_POST['id']:0;   	 		 //Page user is on
						
						
	  				// 1. SQL stmnt
						$sql = $this->_db->prepare("  UPDATE new_hires 
												        SET   fname = ?,
												        lname 		= ?,
												        title		= ?, 
												        manager		= ?, 
												        department	= ?, 
												        status2 	= ?
														WHERE id      = ?     ");    
			     
					// 2. Execute	 
					   	$sql->execute(array(  $this->fname, $this->lname, $this->title, $this->manager, $this->department,     $this->status2, 
 $_POST['id'] ));
					   	
				 
					// 3. SQL stmnt
						$sql2 = $this->_db->prepare("select id, fname , lname, title, manager, department, start_date, contractor, status2 from new_hires  and status2 = 'New Hire'  and  start_date = '{$curdate}' order by {$sidx}   {$sord}  ");    
			     
					// 4. Execute		
					   	$sql2->execute();

		            // 5. GET Records
		            	$getRecords = $sql2->fetchAll();
					//echo " no records ";   _search:false

 		
				}
//*************END UPDATE



		    
   				 
//************* FILTERED  SEARCH RECORD     -- or lname 			like '%{$_POST['lname']}%' 
	 			if( isset($_POST['_search'])  &&    $_POST['_search'] === 'true'   )   { 
	  				
		  				// DEFAULTS 
		  			 
		  				$fname 		= isset($_POST['fname'])?$_POST['fname']:"%";   	 //Page user is on
		  				$lname		= isset($_POST['lname'])?$_POST['lname']:"%";   	 //Page user is on
		  				$title 		= isset($_POST['title'])?$_POST['title']:"%";   	 //Page user is on
		  				$manager 		= isset($_POST['manager'])?$_POST['manager']:"%";   	 //Page user is on
		  				$department 	= isset($_POST['department'])?$_POST['department']:"%";   	 //Page user is on
		  				$status2 		= isset($_POST['status2'])?$_POST['status2']:"%";   	 //Page user is on
		  				$id 			= isset($_POST['id'])?$_POST['id']:"";   	 		 //Page user is on
		  			 
		  			
		  			/*
		  			if( isset($_POST['fname'])  &&    $_POST['fname'] 		== ""    )   {  $fname = "%";}  else {  $fname  =    }
		  			if( isset($_POST['lname'])  &&    $_POST['fname'] 		== ""    )   {  $fname = "%";} 
		  			if( isset($_POST['title'])  &&    $_POST['fname'] 		== ""    )   {  $fname = "%";} 
		  			if( isset($_POST['manager'])  &&    $_POST['fname'] 	== ""    )   {  $fname = "%";} 
		  			if( isset($_POST['department'])  &&    $_POST['fname'] 	== ""    )   {  $fname = "%";} 
		  			if( isset($_POST['status2'])  &&    $_POST['fname'] 	== ""    )   {  $fname = "%";} 
		  			if( isset($_POST['id'])  &&    $_POST['fname'] 			== ""    )   {  $fname = 0;}  
		  			*/
		  			
		  				
					// 1. SQL stmnt	   , lname = ?,  title = ?, manager = ?, department = ?,   contractor = ?, status2  = ? 
						$sql = $this->_db->prepare("select id, fname , lname, title, manager, department, contractor, status2 from new_hires
 													WHERE     fname 	    like '%{$fname}%'  
 													     and  lname 		like '%{$lname}%' 
 													     and  title 		like '%{$title}%'  
 													     and  manager 		like '%{$manager}%'  
 													     and  department 	like '%{$department}%'  
 													     and  status2   = 'New Hire'
 													     and start_date = '{$curdate}' 
 													 	 											
 													order by {$sidx}   {$sord} "); 
   
			     		// and  manager_id = ? 
						//where   manager_id     = $this->id 
 
						//$sql	->	execute(array($_POST['manager_name_vc'], $_POST['manager_id'] ));
						$sql	->	execute(  ); //, $this->id   ,  $this->id
						
					// 3. GET Records
		            	$getRecords = $sql->fetchAll();
 
						
				}
//*************END UPDATE


            
 
     




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
					
					//echo json_encode($foo)."\n";
					echo json_encode($foo);
 	
		          }
		        else { echo " no records ";   }
							        
							    	                      
	        }catch(\PDOException $e){
	            echo $e->getMessage();
	        }
	    	 
	     
	    
		  } catch( Exception $e ) { return ($e->getLine() . ": " . $e->getMessage() . " : \n" . $e->getTraceAsString()); }  //CATCH END

     
    }// END FUNCTION
    
  	 	 
	  
}  // END ClASS

 