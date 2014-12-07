 
 

/*	

function onLoad() {
    
    document.addEventListener("deviceready", onDeviceReady, false);
    
    // settings = new Settings();
    // Read and save cameraOptions from the "settings_form" element
    // applySettings();
    
    //$("#settings_ok_button").bind("click", applySettings); 
    //$("#settings_cancel_button").bind("click", restoreSettings); 
 
 
	    
    	//  alert("onLoad  1");  // works
}
 
 */
 
 
 
 /*
 
// Called when Cordova is fully loaded (and calling to Cordova functions has become safe)
function onDeviceReady() {
    
    
     $("#submit_button_id").bind ("click", form_submit);  // works bind click event on submit_button id
    
    
    // Overwrite default behavior of back button
    //document.addEventListener("backbutton", onBackPress, false);
   // fillSettingsInfo("settings_info");
    
    // Bind application button elements with their functionality
    
    
    //$("#name_input_id").bind ("onChange", form_submit);  // test bind click event on submit_button id



 	//$("#date_input_id").bind ("onChange", form_submit);// test bind click event on submit_button id


	//$("#phone_input_id").bind ("onChange", form_submit);// test bind click event on submit_button id


    //$("#get_Image_Button").bind ("click", getImage);  // change button source  



  //  Settings();
    
    //$("#open_lib_button").bind ("click", onCapture);
    //$("#open_alb_button").bind ("click", onCapture);
    //$("#home_button").bind("click", removeTemporaryFiles); 
	//$("#capture_video_button").bind ("click", captureVideoa1);
    //$("#get_Image_Button").bind ("click", getImage);
	
	    
    //	alert("at onDeviceReady ready 2");
} 


  
  
  */


function uploadForm(e) {
    
    
    
     // Prevent the form from posting
       event.preventDefault(); 
    
   //    alert("date" + moskiform.date_input_id.value);
     
     
        
        
   
    
    }




           
   
   /*  
    var formData = new FormData();
	formData.append("part_num", "123ABC"); 
	formData.append("part_price", 7.95);
	formData.append("part_image", somefile)

	var xhr = new XMLHttpRequest();
	xhr.open("POST", "http://some.url/");  
	xhr.send(formData);



    
   
		
		  
    	$('#AppointmentRequest_form').submit(function() {
			var err = false;
			// Hide The Main (Login) Content
			hideMain();
			
			// Reset The Previously Highlighted Form Elements
			inputMapVar.each(function(index){              
				$(this).prev().removeClass(MISSING); 
			});
			
			// Perform Form Validation
			inputMapVar.each(function(index){  
			if($(this).val()==null || $(this).val()==EMPTY){  
				$(this).prev().addClass(MISSING);            
				err = true;
				}          
			});
				 
			// If Validation Fails, Show Dialog Content (Login)
			if(err == true){            
				showContentDialog();
				return false;
			}        
			
			// If Validation Passes, Show Transition Content (Waiting For Response from Server)
			showContentTransition();
			
			// Submit The Form - MRJ - THIS DEALS WITH LOGIN SUCCESS. NEED LOGIC HERE TO DEAL WITH LOGIN FAILURE
			$.post("http://www.exotoolz.com/components/services.cfc?method=emilio", form1Var.serialize(), function(data){
				confirmationVar.text(data);
				alert(confirmationVar);
				//hideContentTransition();
				//showConfirmation();
			});        
			return false;      
   		
   		 });    
    
    */
   
   
   


function form_submit(e) {
    
     // Prevent the form from posting
       event.preventDefault(); 
        
    
    //   alert("date---" + moskiform.date_input_id.value  +  " --- "  +  "phone--" + moskiform.phone_input_id.value  +  " --- "   +  "name=" + moskiform.name_input_id.value );       // debug
      
  	
  	// Gather values
      var formValues = $('#moskiform').serialize();
       
   	//   alert("form values" + formValues); // debug
                  
   	  var url = "http://www.exotoolz.com/components/client_MoskiHairLounge.cfc?method=MokiHairAppointment";
     
    //  alert("url values" + url  );
      
      
   // var url = moskiform.action.value;
 
 
 
 
 if (date_input_id.value == "") {
         
        date_input_id.style.background = 'RED';
        alert("Select Date and Time.");

     							   } 
 else {
 
 		date_input_id.style.background = 'GREEN';

 
 }
 
 
 
 
 
    var error = "";
    var stripped =  phone_input_id.value.replace(/[\(\)\.\-\ ]/g, '');
 
   if (phone_input_id.value == "") {
         
        phone_input_id.style.background = 'RED';
        alert("You didn't enter a phone number.");

     							   } 
     							   
   else if (isNaN(parseInt(stripped))) {
         
        phone_input_id.style.background = 'Red';
         alert("The phone number should be 10 numbers.");
 
      									} 
      									
   else if (!(stripped.length == 10)) {
         
        phone_input_id.style.background = 'Red';
         alert("The phone number should be 10 numbers long.");
 
    									}
      
   
  else   {	
  
  
   phone_input_id.style.background = 'Green';
   
   }
   
   
 
  if (name_input_id.value == "") {
         
        name_input_id.style.background = 'RED';
        alert("Type Your Name.");

     							   } 
     							   
 else if  (name_input_id.value.length < 2 ) { 
      
      name_input_id.style.background = 'RED';
        alert("Type a name longer than two letters.");
 
 }
 
 else  {
 
  name_input_id.style.background = 'GREEN';

 
 }
 
     							     

  	
      
 	     // Post to server or post to web storage
  		if(navigator.onLine) 
  			{
   			 console.log("Online");
    		 $.post(url, formValues, function(data) 
    			{
    			 
      				console.log("Success: "+ data);
      				
      				alert(" Sent.  We will call you shortly.");
      				
    			});
  			}
  		else 
   			{
   				console.log("Offline");
    				if(typeof(Storage) !== "undefined") 
      					{
      						console.log("Storage supported");
      						localStorage.formValues = formValues;
      					}
      			alert("Oops, no connection; try when your cell phone is connected.");
    		}
		 
		
	   
	
	
	           
  
         
     }
  
  
  
  
  function phoneFormat(t)
{var patt = /(\d{3}).*(\d{2}).*(\d{4})/;
var donepatt = /^(\d{3})-(\d{2})-(\d{4})$/;
var str = t.value;
var result;
if (!str.match(donepatt))
{result = str.match(patt);
if (result!= null)
{t.value = t.value.replace(/[^\d]/gi,'');
str = result[1] + '-' + result[2] + '-' + result[3];
t.value = str;
}else{
if (t.value.match(/[^\d]/gi))
t.value = t.value.replace(/[^\d]/gi,'');}
}}

 
  
  function phoneCheckAndFormat(phone, digits) {
    phone = phone.replace(/[^0-9]/g,'');
    digits = (digits > 0 ? digits : 10);
    if (phone.length != digits) {
        return false;
    } else {
        code = '';
        if (digits == 11) {
            code = '1 ';
            phone = phone.substring(1);
        }
        area = phone.substring(0,3);
        prefix = phone.substring(3,6);
        line = phone.substring(6);
        return code + '(' + area + ') ' + prefix + '-' + line;
    }
}


  
 function phone_input_validate (e) 
    { 
    
    //moskiform.phone_input_id.value
     
    var raw_number = phone_input_id.value.replace(/[^0-9]/g,'');
    var regex1 = /^1?([2-9]..)([2-9]..)(....)$/;
    
    if(!regex1.test(raw_number)) {
    // is invalid...
							} 
   else {
    	var formatted_number = str.replace(regex1,'1 ($1) $2 $3')
    	
    	return formatted_number;
		}
		
		
	
  
	}
 

   
   

  
   	 	function get(event)  {
      		// Prevent the form from posting
      		 event.preventDefault(); 

      		// Gather values
      		var formValues = $(this).serialize();
      
      	  	alert(formValues);  
      	  
      	   var url = $(this).attr('action'); 	 	
   	 		alert(url);
   	 	
   	 	
   	 		/*
       	 	$.post('http://www.exotoolz.com/components/client_MoskiHairLounge.cfc?method=MokiHairAppointment', {name: moski_form_id.value},
            	function(output){
                	$('#result').html(output).show();
           		 });
      		 */
       
       
   		 	}
   		 	
 
  
  
  
	 
      function goBack()
  			{
  				window.history.back()
 			 };
 	 
		 
		 

// Calls camera.getPicture() with cameraOptions customised by user

 
 function onCapture(e) {
 
 
	
	   alert("at onCapture  click");
	   
	    
    /*
    
    var callerId = getTargetId(e, "a");
    
    switch (callerId) {
        case "open_camera_button":
            settings.sourceType = Camera.PictureSourceType.CAMERA;
            break;
        case "open_lib_button":
            settings.sourceType = Camera.PictureSourceType.PHOTOLIBRARY;
            break;
        case "open_alb_button":
            settings.sourceType = Camera.PictureSourceType.SAVEDPHOTOALBUM;
            break;
        default:
            return;
            
            */
            
    }
    
    
    
    
    
/*
// Class representing a storage of cameraOptions (optional parameters to customize the camera settings) 
// with which camera.getPicture() is called
// See http://docs.phonegap.com/en/2.0.0/cordova_camera_camera.md.html for cameraOptions description
function Settings() {
    
    
    // set form values to blank
   // this.date.value 	= "";                                       // form.date field value set as blank 
   // this.name.value 	= "a";                                       // form.date field value set as blank 
   // this.phone.value 	= "b";                                       // form.date field value set as blank 
     
}




   
 function onSuccess(data, status)
    {
        data = $.trim(data);
        $("#return").text(data);
    }

    function onError(data, status)
    {
        // handle an error
        alert("Error Submitting Form");
    }       

    $(document).ready(function() {
        $("#submitid").click(function(){

            var formData = $("#myForm").serialize();

            $.ajax({
                type: "POST",
                url: "http://www.exotoolz.com/components/client_MoskiHairLounge.cfc?method=MokiHairAppointment",
                cache: false,
                data: formData,
                success: onSuccess,
                error: onError
            });

            return false;
        });
    });
    
    
    
    
</script>  */ 



/*


 $(document).one('mobileinit', function () {
 
            // Setting #container div as a jqm pageContainer
            $.mobile.pageContainer = $('#container');
 
            // Setting default page transition to slide
            $.mobile.defaultPageTransition = 'slide';
 
        });


*/


 
 
 
 
 
 /* alert script  */
 
 

var ALERT_TITLE = "Appointment Request Sent";
var ALERT_BUTTON_TEXT = "Ok";

if(document.getElementById) {
	window.alert = function(txt) {
		createCustomAlert(txt);
	}
}

function createCustomAlert(txt) {
	d = document;

	if(d.getElementById("modalContainer")) return;

	mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
	mObj.id = "modalContainer";
	mObj.style.height = d.documentElement.scrollHeight + "px";
	
	alertObj = mObj.appendChild(d.createElement("div"));
	alertObj.id = "alertBox";
	if(d.all && !window.opera) alertObj.style.top = document.documentElement.scrollTop + "px";
	alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth)/2 + "px";
	alertObj.style.visiblity="visible";

	h1 = alertObj.appendChild(d.createElement("h1"));
	h1.appendChild(d.createTextNode(ALERT_TITLE));

	msg = alertObj.appendChild(d.createElement("p"));
	//msg.appendChild(d.createTextNode(txt));
	msg.innerHTML = txt;

	btn = alertObj.appendChild(d.createElement("a"));
	btn.id = "closeBtn";
	btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
	btn.href = "##";
	btn.focus();
	btn.onclick = function() { removeCustomAlert();return false; }

	alertObj.style.display = "block";
	
}

function removeCustomAlert() {
	document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
}

 
	
  
 