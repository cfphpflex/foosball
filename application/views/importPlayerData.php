 
 <?php   // TODO: move to class later
 
  $protocol = strpos(strtolower($_SERVER['SERVER_PROTOCOL']),'https') 
                 === FALSE ? 'http' : 'https';
 $host     = $_SERVER['HTTP_HOST'];
 $script   = $_SERVER['SCRIPT_NAME'];
 $params   = $_SERVER['QUERY_STRING'];
  
 $currentUrl = $protocol . '://' . $host . $script . '?' . $params;
  
 //echo $currentUrl;


$protocol = strpos($_SERVER['DOCUMENT_ROOT'], '443') !== false ? 'https://' : 'http://';
$localhost = $protocol . $_SERVER['HTTP_HOST'];
$url = $protocol . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];

//echo $localhost;  //does not exist



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
	       	
	       	
	  	          
 
    	 
    
    	 
    	 // $dbh = new PDO($dsn,'$dbname','$password'); 
    
    
?>

 
    <Script type="text/javascript">
        function addNhForm() {
            document.getElementById('nh-create').style.display = "block"
            document.getElementById('nh-update').style.display = "none"
        }
        function newHireMenu() {
            newHireContainer()
            document.getElementById('row new-hire-menu').style.display = "block"

        }
        function terminationMenu() {

        }
        function greyButtons(){
            document.getElementById('submit').style.disabled = true
            document.getElementById('reset').style.disabled = true
        }
        function newHireAddForm() {
            document.getElementById('nh-create').style.display = "block"
        }
        function newHireContainer() {
            document.getElementById('new-hire-container').style.display = "block"
            document.getElementById('termination-container').style.display = "none"
            document.getElementById('status-change-container').style.display = "none"
        }
        function terminationContainer() {
            document.getElementById('new-hire').style.display = "none"
            document.getElementById('termination').style.display = "block"
            document.getElementById('status-change-container').style.display = "none"
        }
        function isContractor() {
            if (document.getElementById("contractor").checked) {
                document.getElementById("contractor-info").style.display = "block"
            } else {
                document.getElementById("contractor-info").style.display = "none"
            }
        }
        function needsGH() {
            if (document.getElementById("gh").checked) {
                document.getElementById("gh_name_field").style.display = "block"
            } else {
                document.getElementById("gh_name_field").style.display = "none"
            }
        }
        function isRemote() {
            if (document.getElementById("remote").checked) {
                document.getElementById("international").style.display = "block"
            } else {
                document.getElementById("international").style.display = "none"
		document.getElementById("inter-yes").checked = false
		document.getElementById("inter-no").checked = false
                document.getElementById('remote-info').style.display = "none"
                document.getElementById('inter-region').style.display = "none"
            }
        }
        function isInternational() {
            if (document.getElementById('inter-yes').checked) {

                document.getElementById('inter-region').style.display = "block"
                document.getElementById('remote-info').style.display = "block"
                document.getElementById('inter-no').checked = false
            } else {
                document.getElementById('inter-region').style.display = "none"
            }
        }
        function isInter() {
            if (document.getElementById('inter-no').checked) {
                document.getElementById('remote-info').style.display = "block"
                document.getElementById('inter-region').style.display = "none"
                document.getElementById('inter-yes').checked = false
            } else {
                document.getElementById('remote-info').style.display = "none"
            }
        }
    </Script>

 

	
<div id="page">	



 
 <form action="http://localhost/foosball/index.php/Import/upload" method="post" accept-charset="utf-8"  name="new-hire-form" id="new-hire-form"  enctype="multipart/form-data" > 
 
	<div id="accordion">
	<br><br>
	  <ol>
		  
     	<li>
		      <a href="#one">Import:  Player Historic Data</a>
		      <div id="one" class="accordion">
		    	
			     <fieldset id="account_info" style="display: list-item; text-align: left;">
			    
			   		
			   		<p class="field">
						<label for="fname">Upload:</label>
						 <input name="userfile2" type="file" />
					</p>
					
					<p class="field">
						<label for="datepicker">Start Date:</label>
						<input type="date" name="start-date" id="datepicker" required="true"
					                        value="" size="50">
					</p>
					
					<input type="submit" class="login-submit" value="SUBMIT">

				</fieldset>		 


			</div>
		</li>
    
      
  	</ol>
  
  

    
  </form>
  
   
  
</div>

 
</div>
</div>

 
 





</body>
</html>

