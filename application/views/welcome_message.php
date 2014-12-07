 
 <?php 
 

       			$protocol = strpos($_SERVER['DOCUMENT_ROOT'], '443') !== false ? 'https://' : 'http://';
       			$localhost = $protocol . $_SERVER['HTTP_HOST'];
				$url = $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
				
			//	echo $localhost;  //does not exist
				
			
		 
		 	//include_once('/hr-portal/model/Manager.php');
		  
		 
		 	 
			 		
	       	// Assign all the class objects that were instantiated by the
	       			// bootstrap file (CodeIgniter.php) to local class variables
	       			// so that CI can run as one big super object.
	       			foreach (is_loaded() as $var => $class)
	       			{
	       			    //print_r(load_class($class));
	       			    //echo("<br>");
	       			    
	       				$this->$var =& load_class($class);
	       				//print_r($this);
	       			}
	       	
	       	
	 		 // var_dump($this);
		    
		 	
				
		$hostIP = "127.0.0.1";
		$id = 0;
        try{
            //$this->_db = new PDO("mysql:dbname=hrportal;host=$hostIP", "root", "$4@2@m!HW");
            $this->_db = new PDO("mysql:dbname=hrportal;host=127.0.0.1", "root", "");
            //echo("pdo connectiond done". "<br>");
            
           
          
            $stmt = $this->_db->prepare("select * from new_hires  where id = 1 ");
            
           
             
	       // $stmt->bindParam(1, $id);
	        $stmt->execute();
	        $person = $stmt->fetchAll();
	        
	       // var_dump($person);
	        
	        
	        try{
	            $query = $this->_db->prepare("select * from new_hires where id = 1  ");
	
	            $query->execute(array($id));
	            $contractor = $query->fetchAll();
	            $managers = $contractor;
	       
	       
	       		foreach( $contractor as $key1 =>  $val1 ) {
	       			//echo  " has this values:   ";
	       			 
	       		    foreach( $val1 as $key2 =>  $val2 ) {
	       			 //   echo $key2 . " =  " . $val2  . "<br>" ;
	       			 }
	       			 
	       		}
	       
	       		
	       		
	      
	              
	            
	            
	        }catch(\PDOException $e){
	            die($e->getMessage());
	        }
	       
	       
	       
	        
	        
	        
	         

		//	print_r(data);

            
            
            
            
            
                      
        }catch(\PDOException $e){
            echo $e->getMessage();
        }
    	 
    	 
    
    	 
    	 // $dbh = new PDO($dsn,'$dbname','$password'); 
    
    
?>

 

	<div class="page-header">
    <div class="row">
 
     
	  


 

	
<div id="page">	


 <form action="/newhire/create" method="post" accept-charset="utf-8"  name="new-hire-form" id="new-hire-form">
	 
<div id="accordion">
  <ol>
			  <!--	<form action="/newhire/create" method="post" accept-charset="utf-8"  name="new-hire-form" id="new-hire-form">			  -->
			<!--	            <form action="/newhire/create" method="POST" name="new-hire-form" id="new-hire-form">    				-->
					     
    
    <li>
      <a href="#one">New Hire: Registration</a>
      <div id="one" class="accordion">
   
   
			   
			   			
			 <fieldset id="account_info" style="display: list-item; text-align: left;">
			    
			   		
			   		<p class="field">
						<label for="fname">First Name:</label>
						<input type="text" name="fname" id="fname" placeholder="John" required="true"
					                       form="new-hire-form" class="login-input" value="" size="50">
					</p>
					
					<p class="field">
						<label for="lname">Last Name:</label>
						<input type="text" name="lname" id="lname" placeholder="Doe" required="true"
					                       form="new-hire-form" class="login-input" value="" size="50">
					</p>
					 <hr>
					
					<p class="field">
						<label for="title">Title:</label>
						<input type="text" name="title" class="login-input" value="" size="50">
					</p>
				 
				  
					
					<p class="field">
						<label for="manager">Manager:</label>
						
						<?php  	    
						
						
						    
							        try{
							            $query = $this->_db->prepare("select * from new_hires where id = 1  ");
							
							            $query->execute(array($id));
							            $contractor = $query->fetchAll();
							            $managers = $contractor;
							       
							       
							       		foreach( $contractor as $key1 =>  $val1 ) {
							       			//echo  " has this values:   ";
							       			 
							       		    foreach( $val1 as $key2 =>  $val2 ) {
							       			  //	  echo $key2 . " =  " . $val2  . "<br>" ;
							       			 }
							       			 
							       		}
							       		
							       		
							      
							              
							            
							            
							        }catch(\PDOException $e){
							            die($e->getMessage());
							        }


   						?>	
   
   
						<select name="manager" id="manager"  class="login-input" required="true" form="new-hire-form">
			                    <option    class="login-input"  selected="tru">Select the manager...</option>
			                    <?php
			                    
			                    
										     $managers = array(
										    'ajaysingh'=>'Ajay Singh',
									        'alexis'=>'Alexis Schmidt',
									        'aknosp'=>'Andy Knosp',
									        'ari'=>'Ari Zilka',
										    'acm'=>'Arun Murthy',
									        'bmahan'=>'Bob Mahan',
									        'bpage'=>'Bob Page',
									        'cshanklin'=>'Carter Shanklin',
									        'charris'=>'Chris Harris',
									        'csid'=>'Corrie Sid',
									        'cwaygood'=>'Charles Waygood',
										    'dan'=>'Dan Bradford',
									        'dtomlinson'=>'Danielle Tomlinson',
									        'dhoward'=>'David Howard',
									        'dmcjannet'=>'David McJannet',
									        'drahm'=>'David Rahm',
									        'dschorow'=>'David Schorow',
									        'dmaudru'=>'Denise Maudru',
									        'emizell'=>'Eric Mizell',
									        'ebergenholtz'=>'Erik Bergenholtz',
									        'fmonteon'=>'Frank Monteon',
									        'gvetticaden'=>'George Vetticaden',
									        'gliu'=>'Grant Liu',
									        'gpalvik'=>'Greg Palvik',
									        'ghagleitner'=>'Gunther Hagleitner',
									        'herb'=>'Herb Cunitz',
									        'jengesser'=>'Jamie Engesser',
									        'jmarkham'=>'Jeff Markham',
									        'jmiller'=>'Jeff Miller',
										    'jlesperance'=>'Jesse Lesperance',
										    'jirvin' => 'Jim Irvin',
										    'jim'=>'Jim Walker',
									        'john'=>'John Kriesa',
									        'joduinn'=>'John O\'Duinn',
									        'janderson'=>'Jon Anderson',
									        'jsheppard'=>'Julie Sheppard',
									        'kkettering'=>'Keegan Kettering',
									        'manju'=>'Manju Rao',
									        'mholmes'=>'Marc Holmes',
									        'mjohnson'=>'Mark Johnson',
									        'mprinz'=>'Mark Prinz',
									        'mfoley'=>'Matt Foley',
										    'mfunke' => 'Matthias Funke',
									        'mregnell'=>'Mel Regnell',
									        'melissa'=>'Melissa Warner',
									        'mharo'=>'Mike Haro',
									        'mperez'=>'Mike Perez',
									        'mproia'=>'Mike Proia',
									        'mitch'=>'Mitch Ferguson',
									        'pphillips'=>'Paul Phillips',
									        'pthangali'=>'Pramod Thangali',
									        'rvenkatesh'=>'Ram Venkatesh',
									        'rraposa'=>'Rich Raposa',
									        'rmorris'=>'Rick Morris',
									        'rabbott'=>'Rob Abbott',
									        'rob'=>'Rob Bearden',
									        'sdavidson'=>'Scott Davidson',
									        'shuan'=>'Shaun Connolly',
									        'sjagoe'=>'Shelby Jagoe',
										    'sgupta' => 'Shivani Gupta',
									        'skornluebke'=>'Stacy Kornluebke',
									        'suresh'=>'Suresh Srinivas',
									        'thall'=>'Tim Hall',
									        'truehle'=>'Tim Ruehle',
									        'tcooper'=>'Tom Cooper',
									        'tmccuch'=>'Tom McCuch',
									        'tdeblauwe'=>'Tony Deblauwe',
									        'tramos'=>'Tony Ramos'
									  );
									

			                     	foreach ($managers as $key => $val) {
				                        echo "<option value='{$key}'>{$val}</option>";
				                    }
			                    
			                     
			                    
			                    
			                    ?>
					    </select>
					</p>

					
					 		
					
					<p class="field">
						<label for="department">Department:</label>
						<input type="text" name="department" id="department" placeholder="G&A" required="true"
					                       form="new-hire-form" class="login-input" value="" size="50">
					</p>

 
					<p class="field">
						<label for="datepicker">Start Date:</label>
						<input type="date" name="start-date" id="datepicker" required="true"
					                       form="new-hire-form" value="" size="50">
					</p>


					
					<p class="field">
						<input type="submit" class="login-submit" value="NEXT">
					</p>
					
					
			 	</fieldset>  


      </div>
    </li>
    
    
    









     
    <li>
      <a href="#two"> Accounts Needed</a>
      <div id="two" class="accordion">
   
      			
			 <fieldset id="account_info"  style="display: inline-table; text-align: left;">
			    
			    	<legend></legend>
			    	<p class="field">
						<label for	="sfdc">Salesforce</label> 
						<input type	="checkbox"
							   class="checkbox-input"
			                   name	="sfdc"
		                       value="1"
		                       id	="sfdc"
		                       form	="new-hire-form"
		                       value="" 
		                       	>
					</p>
					<p class="field">
						<label for="tb">TurboBridge</label>
						<input class="checkbox-input"
		                       type="checkbox"
		                       name="turbobridge"
		                       value="1"
		                       id="tb"
		                       form="new-hire-form"		                       
		                       value="" 
		                       	>
					</p>	


					<p class="field">
						<label for="rc">RingCentral</label>
						<input class="checkbox-input"
		                       type="checkbox"
		                       name="ringcentral"
		                       value="1"
		                       id="rc"
		                       form="new-hire-form"			                       
		                       value="" 
		                        	>
					</p>					
				 
				 
			    	<p class="field">
						<label for="oa">OpenAir</label>
						<input type="checkbox"
							   class="checkbox-input"
		                       name="openair"
		                       value="1"
		                       id="oa"
		                       form="new-hire-form"
			                       
		                       value="" 
		                        	>
					</p>
					
					<p class="field">
						<label for="tb">TurboBridge</label>
						<input class="checkbox-input"
		                       type="checkbox"
		                       name="turbobridge"
		                       value="1"
		                       id="tb"
		                       form="new-hire-form"		                       
		                       value="" 
		                        	>
					</p>	

					<p class="field">
						<label for="ej">Eng Jira</label>
						<input class="checkbox-input"
		                       type="checkbox"
		                        name="engjira"
		                		value="1"
		                		id="ej"
		                		form="new-hire-form"		                       
		                       value="" 
		                        	>
					</p>	

					<p class="field">
						<label for="gh">Github</label>
						<input class="checkbox-input"
		                       type="checkbox"
		                       name="github"
		                       value="1"
		                       id="gh"
		                       form="new-hire-form" onclick="needsGH()"	                       
		                       value="" 
		                        	>
					</p>	


					<p class="field"  id="gh_name_field">
						<label for="gh_name">username:</label>
						<input class="checkbox-input"
		                       type="text"
		                       name="github_name"
							   id="gh_name"
		                       form="new-hire-form"                       
		                       value="" 
		                       size	="50"	>
					</p>	

 
			    
			        
			    </table>
	 	</fieldset>  


      </div>
    </li>
    
    
    
     
    
    <li>
     
      <a href="#three">Contractor Info</a>
      <div id="three" class="accordion">
               
				<fieldset id="cont-info">
				    <legend></legend>
				    <label 	for="contractor"><strong>Contractor?</strong></label> 
				    <input 	type="checkbox"
	                        name="contractor"
	                        value="1"
	                        id="contractor"
	                        form="new-hire-form"
	                        onclick="isContractor()"/><br/>
				    
				    <section id="contractor-info">
				        Does the contractor need a computer? <label for="computer">Yes</label> 
				        <input type="checkbox"
	                              name="computer"
	                              value="1"
	                              form="new-hire-form"/>
							<br/>
				    </section>
				    
				</fieldset>
				
				
				
				
				 
      </div>
      
    </li>   
    
    
    
    
    
    <li>
     
      <a href="#four">ORIGINAL FORM: </a>
      <div id="four" class="accordion">
					    
					 
				 
					<form action="http://localhost/hr-portal/view/newhire/create.php" method="POST" name="new-hire-form" id="new-hire-form">
					<fieldset>
					    <legend>New Hire Info</legend>
					    <table>
					        <tr>
					            <td><label for="fname">First Name:</label></td>
					            <td><input type="text" name="fname" id="fname" placeholder="John" required="true"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="lname">Last Name:</label></td>
					            <td><input type="text" name="lname" id="lname" placeholder="Doe" required="true"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="title">Title:</label></td>
					            <td><input type="text" name="title" id="title" placeholder="Director of Directing"
					                       required="true" form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="manager">Manager:</label></td>
					            <td><select name="manager" id="manager" required="true" form="new-hire-form">
					                    <option selected="tru">Select the manager...</option>
					                    <?php
					                    foreach ($this->managers as $key => $val) {
					                        echo "<option value='{$key}'>{$val}</option>";
					                    }
					                    ?>
					                </select></td>
					        </tr>
					        <tr>
					            <td><label for="department">Department:</label></td>
					            <td><input type="text" name="department" id="department" placeholder="G&A" required="true"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="datepicker">Start Date:</label></td>
					            <td><input type="date" name="start-date" id="datepicker" required="true"
					                       form="new-hire-form"/></td>
					        </tr>
					    </table>
					</fieldset>
					
					
					<fieldset id="account_info">
					    <legend>Accounts Needed</legend>
					    <table>
					        <tr>
					            <td><label for="sfdc">Salesforce</label></td>
					            <td><input type="checkbox"
					                       name="sfdc"
					                       value="1"
					                       id="sfdc"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="oa">OpenAir</label></td>
					            <td><input type="checkbox"
					                       name="openair"
					                       value="1"
					                       id="oa"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="rc">RingCentral</label></td>
					            <td><input type="checkbox"
					                       name="ringcentral"
					                       value="1"
					                       id="rc"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="tb">TurboBridge</label></td>
					            <td><input type="checkbox"
					                       name="turbobridge"
					                       value="1"
					                       id="tb"
					                       form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="ej">Eng Jira</label></td>
					            <td><input type="checkbox"
					                        name="engjira"
					                value="1"
					                id="ej"
					                form="new-hire-form"/></td>
					        </tr>
					        <tr>
					            <td><label for="gh">Github</td>
					            <td><input type="checkbox"
					                       name="github"
					                       value="1"
					                       id="gh"
					                       form="new-hire-form" onclick="needsGH()"/></td>
					        </tr>
					        <tr id="gh_name_field">
					            <td><label for="gh_name">username:</td>
					            <td><input type="text"
					                       name="github_name"
					
					                       id="gh_name"
					                       form="new-hire-form"/></td>
					        </tr>
					    </table>
					</fieldset>
					<fieldset id="cont-info">
					    <legend>Contractor Info</legend>
					    <label for="contractor"><strong>Contractor?</strong></label> <input type="checkbox"
					                                                                        name="contractor"
					                                                                        value="1"
					                                                                        id="contractor"
					                                                                        form="new-hire-form"
					                                                                        onclick="isContractor()"/><br/>
					    <section id="contractor-info">
					        Does the contractor need a computer? <label for="computer">Yes</label> <input type="checkbox"
					                                                                                      name="computer"
					                                                                                      value="1"
					                                                                                      form="new-hire-form"/>
					        <br/>
					    </section>
					</fieldset>
					<fieldset id="rem-info">
					    <legend>Remote Info</legend>
					    <label for="remote"><strong>Remote?</strong></label> <input type="checkbox" name="remote"
					                                                                id="remote"
					                                                                value="1"
					                                                                onclick="isRemote()"
					                                                                form="new-hire-form"/><br/>
					    <section id="international">
					        <label for="international"><strong>International New Hire?</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;No<input
					            type="checkbox" name="inter-no" id="inter-no" value="1" onclick="isInter()"
					            form="new-hire-form"/> | &nbsp;&nbsp;&nbsp;&nbsp;Yes<input type="checkbox" name="inter-yes"
					                                                                       id="inter-yes" value="1"
					                                                                       onclick="isInternational()"
					                                                                       form="new-hire-form"/>
					    </section>
					    <section id="remote-info">
					        <table>
					            <tr>
					                <td><label for="address1">Address 1:</label></td>
					                <td><input type="text" name="address1" id="address1" placeholder="1234 Some Rd."
					                           form="new-hire-form"/></td>
					            </tr>
					            <tr>
					                <td><label for="address2">Address 2:</label></td>
					                <td><input type="text" name="address2" id="address2" placeholder="Ste. 123"
					                           form="new-hire-form"/></td>
					            </tr>
					            <tr>
					                <td><label for="city">City:</label></td>
					                <td><input type="text" name="city" id="city" placeholder="Someplace"
					                           form="new-hire-form"/></td>
					            </tr>
					            <tr>
					                <td><label for="state">State: </label></td>
					                <td><input type="text" name="state" id="state" placeholder="CA" form="new-hire-form"/>
					                </td>
					            </tr>
					            <tr>
					                <td><label for="zip">Zip Code: </label></td>
					                <td><input type="text" name="zip" id="zip" placeholder="12345-1234"
					                           form="new-hire-form"/></td>
					            </tr>
							<section id="inter-region">
					            <tr>
					                <td><label for="country">Country: </label></td>
					                <td><input type="text" name="country" id="country" placeholder="Uganda"
					                           form="new-hire-form"/></td>
					            </tr>
					    </section>
					            <tr>
					                <td><label for="email">Email: </label></td>
					                <td><input type="email" name="email" id="email" placeholder="someone@domain.com"
					                           form="new-hire-form"/></td>
					            </tr>
					            <tr>
					                <td><label for="tel">Telephone: </label></td>
					                <td><input type="tel" name="tel" id="tel" placeholder="+1 (999)999-9999"
					                           form="new-hire-form"/></td>
					            </tr>
					        </table>
					    </section>
					
					</fieldset>
					<fieldset id="distro-lists">
					    <legend>DL Selection</legend>
					    <ul class="no-li-style">
					        <li>E-Staff: <input type="checkbox" name="dl[]" id="e-staff" value="e-staff"/></li>
					        <li>CEO's Org: <input type="checkbox" name="dl[]" id="ceo-org" value="ceo-org"/></li>
					        <li>COO's Org: <input type="checkbox" name="dl[]" id="coo-org" value="coo-org"/></li>
					        <li>CFO's Org: <input type="checkbox" name="dl[]" id="cfo-org" value="cfo-org"/></li>
					        <li>CTO's Org: <input type="checkbox" name="dl[]" id="cto-org" value="cto-org"/></li>
					        <li>CIO's Org: <input type="checkbox" name="dl[]" id="cio-org" value="cio-org"/></li>
					        <li>PSO's Org: <input type="checkbox" name="dl[]" id="pso-org" value="pso-org"/></li>
					        <li>Hiring Managers: <input type="checkbox" name="dl[]" id="hiringmanagers" value="hiringmanagers"/></li>
					        <li>Finance: <input type="checkbox" name="dl[]" id="finance" value="finance" disabled/>
					            <ul class="no-li-style">
					                <li>Payroll: <input type="checkbox" name="dl[]" id="payroll" value="payroll"/></li>
					                <li>Expenses: <input type="checkbox" name="dl[]" id="expenses" value="expenses"/></li>
					                <li>CreditCard: <input type="checkbox" name="dl[]" id="creditcard" value="creditcard"/></li>
					                <li>AP: <input type="checkbox" name="dl[]" id="ap" value="ap"/></li>
					                <li>AR: <input type="checkbox" name="dl[]" id="ar" value="ar"/></li>
					            </ul>
					        </li>
					        <li>HR: <input type="checkbox" name="dl[]" id="hr" value="hr" disabled/>
					            <ul class="no-li-style">
					                <li>Recruiting: <input type="checkbox" name="dl[]" id="recruiting" value="recruiting"/></li>
					                <li>CorpHR: <input type="checkbox" name="dl[]" id="corphr" value="corphr"/></li>
					            </ul>
					        </li>
					        <li>EA: <input type="checkbox" name="dl[]" id="ea" value="ea"/></li>
					        <li>SalesOps: <input type="checkbox" name="dl[]" id="salesops" value="salesops"/></li>
					        <li>IT: <input type="checkbox" name="dl[]" id="it" value="it" disabled/>
					            <ul class="no-li-style">
					                <li>IT Management: <input type="checkbox" name="dl[]" id="itmgmt" value="itmgmt"/></li>
					                <li>ITSup: <input type="checkbox" name="dl[]" id="itsup" value="itsup"/></li>
					                <li>ITOps: <input type="checkbox" name="dl[]" id="itops" value="itops" disabled/>
					                    <ul class="no-li-style">
					                        <li>SysOps: <input type="checkbox" name="dl[]" id="sysops" value="sysops"/></li>
					                        <li>DevOps: <input type="checkbox" name="dl[]" id="devops" value="devops"/></li>
					                        <li>NetOps: <input type="checkbox" name="dl[]" id="netops" value="netops"/></li>
					                        <li>SecOps: <input type="checkbox" name="dl[]" id="secops" value="secops"/></li>
					                    </ul>
					                </li>
					            </ul>
					        </li>
					        <li>Facilities: <input type="checkbox" name="dl[]" id="facilities" value="facilities"/></li>
					        <li>BizDev: <input type="checkbox" name="dl[]" id="bizdev" value="bizdev"/></li>
					        <li>Marketing: <input type="checkbox" name="dl[]" id="marketing" value="marketing" disabled/>
					            <ul class="no-li-style">
					                <li>ProdMktg: <input type="checkbox" name="dl[]" id="prodmktg" value="prodmktg"/></li>
					                <li>CorpMktg: <input type="checkbox" name="dl[]" id="corpmktg" value="corpmktg"/></li>
					                <li>PartnerMktg: <input type="checkbox" name="dl[]" id="partnermktg" value="partnermktg"/></li>
					                <li>Community: <input type="checkbox" name="dl[]" id="community" value="community"/></li>
					                <li>SvcsMktg: <input type="checkbox" name="dl[]" id="svcsmktg" value="svcsmktg"/></li>
					                <li>CorpComm: <input type="checkbox" name="dl[]" id="corpcomm" value="corpcomm"/></li>
					                <li>UKMktg: <input type="checkbox" name="dl[]" id="ukmktg" value="ukmktg"/></li>
					            </ul>
					        </li>
					        <li>Sales WW: <input type="checkbox" name="dl[]" id="sales-ww" value="sales-ww" disabled/>
					            <ul class="no-li-style">
					                <li>Sales NA: <input type="checkbox" name="dl[]" id="sales-na" value="sales-na" disabled/>
					                    <ul class="no-li-style">
					                        <li>Sales NA West: <input type="checkbox" name="dl[]" id="sales-na-west" value="sales-na-west"/>
					                        </li>
					                        <li>Sales NA Central: <input type="checkbox" name="dl[]" id="sales-na-central"
					                                                     value="sales-na-central"/></li>
					                        <li>Sales NA South: <input type="checkbox" name="dl[]" id="sales-na-south"
					                                                   value="sales-na-south"/></li>
					                        <li>Sales NA North: <input type="checkbox" name="dl[]" id="sales-na-north"
					                                                   value="sales-na-north"/></li>
					                        <li>Sales NA Fed: <input type="checkbox" name="dl[]" id="sales-na-fed" value="sales-na-fed"/>
					                        </li>
					                        <li>Sales NA Inside: <input type="checkbox" name="dl[]" id="sales-na-inside"
					                                                    value="sales-na-inside"/></li>
					                    </ul>
					                </li>
					                <li>Sales EMEA: <input type="checkbox" name="dl[]" id="sales-emea" value="sales-emea" disabled/>
					                    <ul class="no-li-style">
					                        <li>Sales EMEA UK: <input type="checkbox" name="dl[]" id="sales-emea-uk" value="sales-emea-uk"/>
					                        </li>
					                        <li>Sales EMEA FR: <input type="checkbox" name="dl[]" id="sales-emea-fr" value="sales-emea-fr"/>
					                        </li>
					                        <li>Sales EMEA DE: <input type="checkbox" name="dl[]" id="sales-emea-de" value="sales-emea-de"/>
					                        </li>
					                        <li>Sales EMEA Inside: <input type="checkbox" name="dl[]" id="sales-emea-inside"
					                                                      value="sales-emea-inside"/></li>
					                    </ul>
					                </li>
					                <li>Sales APAC: <input type="checkbox" name="dl[]" id="sales-apac" value="sales-apac" disabled/>
					                    <ul class="no-li-style">
					                        <li>Sales APAC KR: <input type="checkbox" name="dl[]" id="sales-apac-kr" value="sales-apac-kr"/>
					                        </li>
					                        <li>Sales APAC SG: <input type="checkbox" name="dl[]" id="sales-apac-sg" value="sales-apac-sg"/>
					                        </li>
								<li>Sales APAC CN: <input type="checkbox" name="dl[]" id="sales-apac-cn" value="sales-apac-cn"/>
								</li>
								<li>Sales APAC IN: <input type="checkbox" name="dl[]" id="sales-apac-in" value="sales-apac-in"/>
								</li>
					                    </ul>
					                </li>
					            </ul>
					        </li>
					        <li>SE WW: <input type="checkbox" name="dl[]" id="se-ww" value="se-ww" disabled/>
					            <ul class="no-li-style">
					                <li>SE NA: <input type="checkbox" name="dl[]" id="se-na" value="se-na" disabled/>
					                    <ul class="no-li-style">
					                        <li>SE NA West: <input type="checkbox" name="dl[]" id="se-na-west" value="se-na-west"/></li>
					                        <li>SE NA Central: <input type="checkbox" name="dl[]" id="se-na-central" value="se-na-central"/>
					                        </li>
					                        <li>SE NA South: <input type="checkbox" name="dl[]" id="se-na-south" value="se-na-south"/></li>
					                        <li>SE NA North: <input type="checkbox" name="dl[]" id="se-na-north" value="se-na-north"/></li>
					                        <li>SE NA Fed: <input type="checkbox" name="dl[]" id="se-na-fed" value="se-na-fed"/></li>
					                    </ul>
					                </li>
					                <li>SE EMEA: <input type="checkbox" name="dl[]" id="se-emea" value="se-emea" disabled/>
					                    <ul class="no-li-style">
					                        <li>SE EMEA UK: <input type="checkbox" name="dl[]" id="se-emea-uk" value="se-emea-uk"/></li>
					                        <li>SE EMEA FR: <input type="checkbox" name="dl[]" id="se-emea-fr" value="se-emea-fr"/></li>
					                        <li>SE EMEA DE: <input type="checkbox" name="dl[]" id="se-emea-de" value="se-emea-de"/></li>
					                        <li>SE EMEA Inside: <input type="checkbox" name="dl[]" id="se-emea-inside"
					                                                   value="se-emea-inside"/></li>
					                    </ul>
					                </li>
					                <li>SE APAC: <input type="checkbox" name="dl[]" id="se-apac" value="se-apac" disabled/>
					                    <ul class="no-li-style">
					                        <li>SE APAC KR: <input type="checkbox" name="dl[]" id="se-apac-kr" value="se-apac-kr"/></li>
					                        <li>SE APAC SG: <input type="checkbox" name="dl[]" id="se-apac-sg" value="se-apac-sg"/></li>
								<li>SE APAC CN: <input type="checkbox" name="dl[]" id="se-apac-cn" value="se-apac-cn"/></li>
					                        <li>SE APAC IN: <input type="checkbox" name="dl[]" id="se-apac-in" value="se-apac-in"/></li>
					                    </ul>
					                </li>
					                <li>SE Channels: <input type="checkbox" name="dl[]" id="se-channels" value="se-channels"/></li>
					            </ul>
					        </li>
					        <li>PSO WW: <input type="checkbox" name="dl[]" id="pso-ww" value="pso-ww" disabled/>
					            <ul class="no-li-style">
					                <li>PSO NA: <input type="checkbox" name="dl[]" id="pso-na" value="pso-na" disabled/>
					                    <ul class="no-li-style">
					                        <li>PSO NA West: <input type="checkbox" name="dl[]" id="pso-na-west" value="pso-na-west"/></li>
					                        <li>PSO NA Central: <input type="checkbox" name="dl[]" id="pso-na-central"
					                                                   value="pso-na-central"/>
					                        </li>
					                        <li>PSO NA South: <input type="checkbox" name="dl[]" id="pso-na-south" value="pso-na-south"/>
					                        </li>
					                        <li>PSO NA North: <input type="checkbox" name="dl[]" id="pso-na-north" value="pso-na-north"/>
					                        </li>
					                        <li>PSO NA Fed: <input type="checkbox" name="dl[]" id="pso-na-fed" value="pso-na-fed"/></li>
					                    </ul>
					                </li>
					                <li>PSO EMEA: <input type="checkbox" name="dl[]" id="pso-emea" value="pso-emea" disabled/>
					                    <ul class="no-li-style">
					                        <li>PSO EMEA UK: <input type="checkbox" name="dl[]" id="pso-emea-uk" value="pso-emea-uk"/></li>
					                        <li>PSO EMEA FR: <input type="checkbox" name="dl[]" id="pso-emea-fr" value="pso-emea-fr"/></li>
					                        <li>PSO EMEA DE: <input type="checkbox" name="dl[]" id="pso-emea-de" value="pso-emea-de"/></li>
					                        <li>PSO EMEA Inside: <input type="checkbox" name="dl[]" id="pso-emea-inside"
					                                                    value="pso-emea-inside"/></li>
					                    </ul>
					                </li>
					                <li>PSO APAC: <input type="checkbox" name="dl[]" id="pso-apac" value="pso-apac" disabled/>
					                    <ul class="no-li-style">
					                        <li>PSO APAC KR: <input type="checkbox" name="dl[]" id="pso-apac-kr" value="pso-apac-kr"/></li>
					                        <li>PSO APAC SG: <input type="checkbox" name="dl[]" id="pso-apac-sg" value="pso-apac-sg"/></li>
								<li>PSO APAC CN: <input type="checkbox" name="dl[]" id="pso-apac-cn" value="pso-apac-cn"/></li>
					                        <li>PSO APAC IN: <input type="checkbox" name="dl[]" id="pso-apac-in" value="pso-apac-in"/></li>
					                    </ul>
					                </li>
					                <li>PSO Ops: <input type="checkbox" name="dl[]" id="pso-ops" value="pso-ops"/></li>
					                <li>Training WW: <input type="checkbox" name="dl[]" id="training-ww" value="training-ww" disabled/>
					                    <ul class="no-li-style">
					                        <li>Training Ops: <input type="checkbox" name="dl[]" id="training-ops" value="trainingops"/>
					                        </li>
					                        <li>Training Certs: <input type="checkbox" name="dl[]" id="training-certs"
					                                                   value="trainingcerts"/></li>
					                        <li>Training Dev: <input type="checkbox" name="dl[]" id="training-dev" value="trainingdev"/>
					                        </li>
					                    </ul>
					                </li>
					            </ul>
					        </li>
					        <li>ProductMgmt: <input type="checkbox" name="dl[]" id="productmgmt" value="productmgmt" disabled/>
					            <ul class="no-li-style">
					                <li>TechDocs: <input type="checkbox" name="dl[]" id="techdocs" value="techdocs"/></li>
					                <li>PM: <input type="checkbox" name="dl[]" id="pm" value="pm"/></li>
					            </ul>
					        </li>
					        <li>Eng WW: <input type="checkbox" name="dl[]" id="eng-ww" value="eng-ww" disabled />
					            <ul class="no-li-style">
					                <li>Eng Dev: <input type="checkbox" name="dl[]" id="eng-dev" value="eng-dev" disabled/>
					                    <ul class="no-li-style">
					                        <li>Eng Dev Data: <input type="checkbox" name="dl[]" id="eng-dev-data" value="eng-dev-data"/></li>
					                        <li>Eng Dev Ops: <input type="checkbox" name="dl[]" id="eng-dev-ops"
					                                                   value="eng-dev-ops"/>
					                        </li>
					                        <li>Eng Dev HDFS: <input type="checkbox" name="dl[]" id="eng-dev-hdfs" value="eng-dev-hdfs"/>
					                        </li>
					                        <li>Eng Dev Core: <input type="checkbox" name="dl[]" id="eng-dev-core" value="eng-dev-core"/>
					                        </li>
					                        <li>Eng Dev Infra: <input type="checkbox" name="dl[]" id="eng-dev-infra" value="eng-dev-infra"/></li>
					                    </ul>
					                </li>
					                <li>Eng TRE: <input type="checkbox" name="dl[]" id="eng-tre" value="eng-tre" disabled/>
					                    <ul class="no-li-style">
					                        <li>Eng TRE Data: <input type="checkbox" name="dl[]" id="eng-tre-data" value="eng-tre-data"/></li>
					                        <li>Eng TRE Ops: <input type="checkbox" name="dl[]" id="eng-tre-ops" value="eng-tre-ops"/></li>
					                        <li>Eng TRE HDFS: <input type="checkbox" name="dl[]" id="eng-tre-hdfs" value="eng-tre-hdfs"/></li>
					                        <li>Eng TRE Core: <input type="checkbox" name="dl[]" id="eng-tre-core"
					                                                    value="eng-tre-core"/></li>
					                        <li>Eng TRE Infra: <input type="checkbox" name="dl[]" id="eng-tre-infra"
					                                                 value="eng-tre-infra"/></li>
					                    </ul>
					                </li>
					                <li>Eng Kiev: <input type="checkbox" name="dl[]" id="eng-kiev" value="eng-kiev"/></li>
					                <li>Eng Support: <input type="checkbox" name="dl[]" id="eng-support" value="eng-sup"/></li>
					            </ul>
					        </li>
					    </ul>
					</fieldset>
					<section id="form-buttons">
					    <p><strong>Processing takes up to 30 seconds.<br/>** Please do not refresh page or press 'back' button</strong></p>
					    <input type="submit" name="submit" value="Process" onclick="greyButtons()" id="submit"/> <input type="reset"
					                                                                name="reset"
					                                                                value="Cancel" id="reset"/>
					</section>
					</form>



     </div>
      
    </li>   
    



    
    
  </ol>
</div>






</div>
</div>

 

 

 
</div>
</div>
<div id="status-change">Status Change</div>
<div id="termination-container">Term</div>
</div>







</body>
</html>

