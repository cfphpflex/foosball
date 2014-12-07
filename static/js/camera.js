
/*
 
 * 
 *   ft.upload(path,
            "http://www.exotoolz.com/components/services.cfc?method=emilio",
            function(result) {
                console.log('Upload success: ' + result.responseCode);
                console.log(result.bytesSent + ' bytes sent');
            },
            function(error) {
                console.log('Error uploading file ' + path + ': ' + error.code);
            },
            { fileName: name });
 */

// Stores cameraOptions (optional parameters to customize camera settings) with which camera.getPicture() is called
var settings;

// Class representing a storage of cameraOptions (optional parameters to customize the camera settings) 
// with which camera.getPicture() is called
// See http://docs.phonegap.com/en/2.0.0/cordova_camera_camera.md.html for cameraOptions description
function Settings() {
    
    // Opening options:
    if ((typeof Camera !== "undefined")) {
        
        this.destinationType = Camera.DestinationType.FILE_URI;     // cameraOptions: destinationType
        this.sourceType = Camera.PictureSourceType.PHOTOLIBRARY;    // cameraOptions: sourceType
        this.mediaType = Camera.MediaType.PICTURE;                  // cameraOptions: mediaType
    }
    
    // Photo quality and editing options:
    this.quality = 40;                                          // cameraOptions: quality
    this.targetWidth = 500;                                     // cameraOptions: targetWidth
    this.targetHeight = 500;                                    // cameraOptions: targetHeight
    this.allowEdit = true;                                      // cameraOptions: allowEdit
    this.correctOrientation = true;                             // cameraOptions: correctOrientation
    
    // Saving options:
    this.encodingType = (typeof Camera !== "undefined") ? Camera.EncodingType.JPEG : 0;               // cameraOptions: encodingType
    this.saveToPhotoAlbum = true;                                                                     // cameraOptions: saveToPhotoAlbum
    
    // iOS-specific (to specify popover location in iPad):
    this.popoverOptions = ((typeof Camera !== "undefined") && (typeof CameraPopoverOptions !== "undefined")) ? new CameraPopoverOptions(220, 600, 320, 480, Camera.PopoverArrowDirection.ARROW_DOWN) : null;    // cameraOptions: popoverOptions
}

// Called on bodyLoad 
function onLoad() {
    
    document.addEventListener("deviceready", onDeviceReady, false);
    
//     $("#submit_button_id").bind ("click", form_submit);  // works bind click event on submit_button id  // process form s

    
    settings = new Settings();
    // Read and save cameraOptions from the "settings_form" element
    applySettings();
    
    $("#settings_ok_button").bind("click", applySettings); 
    $("#settings_cancel_button").bind("click", restoreSettings); 
}

// Called when Cordova is fully loaded (and calling to Cordova functions has become safe)
function onDeviceReady() {
    
     

    document.addEventListener("backbutton", onBackPress, false);
    
     
  //   $("#submit_button_id").bind ("click", form_submit);  // works bind click event on submit_button id
    
         
    // Bind application button elements with their functionality
   // $("#open_camera_button").bind ("click", onCapture);
   // $("#open_lib_button").bind ("click", onCapture);
   // $("#open_alb_button").bind ("click", onCapture);
  //  $("#home_button").bind("click", removeTemporaryFiles); 
	//$("#capture_video_button").bind ("click", captureVideo);
//	$("#get_Image_Button").bind ("click", getImage);
	
	 
} 








function uploadForm(e) {
    
    
    
     // Prevent the form from posting
       event.preventDefault(); 
    
   //    alert("date" + moskiform.date_input_id.value);
     
     
 }






   



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
  
  
  
  
  


// called by SUbmit button onclick funcion
function getImage() {
	
	 
	
	//alert( navigator.camera.DestinationType.FILE_URI );
	//abort;
	 
		// Retrieve image file location from specified source
	    navigator.camera.getPicture(uploadPhoto, function(message) {
					alert('get picture failed');
				},{
					quality: 50, 
					destinationType: navigator.camera.DestinationType.FILE_URI,
					sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY
				});

}







 






		
		  function uploadFile(mediaFile){
		  
		  
		   Alert("test");
		   abort;
		  
		  	var upload_url = "http://www.exotoolz.com/components/services.cfc?method=emilio";
		  	
		  	var options = new FileUploadOptions();
		  	options.fileName = mediaFile.name;
		  	options.mimeType = "*/*";
		  	options.chunkedMode = false;
		  	
		  	path = mediaFile.fullPath;
		  	
		  	
		  	var ft = new FileTransfer();
		  	var options = new FileUploadOptions();
		  	options.fileKey = "document";
		  	options.params = {};
		  	options.fileName = fileName;
		  	options.params.fileName = options.fileName;
		  	options.chunkedMode = true;
		  	ft.upload(fileURI, upload_url, function(result){
		  		alert("Video Upload Succes");
		  	}, function(error){
		  		alert("Video Fail");
		  	}, options);
		  	
		  }
		
		/*
                var ft = new FileTransfer(),
            	path = mediaFile,
            	name = "pic.jpg";
       			 var options = new FileUploadOptions();
                				options.chunkedMode = false;
                        		options.fileKey = "file";
                        		options.fileName = name;
								options.mimeType = "image/jpg";
                        		//options.mimeType = "video/mpeg";
				        ft.upload(path,
				            "http://www.exotoolz.com/components/services.cfm?method=emilio",
				            function(r) {
				                        alert('Success ' + r.response);
				            },
				            function(error) {
				                        alert('Error ' + path + ': ' + error.code);
				            },
				            options);
				    }
			*/		






   // Called when capture operation is finished
    //
   // function captureSuccess(mediaFiles) {
        //var i, len;
        //for (i = 0, len = mediaFiles.length; i < len; i += 1) {
           // uploadFile(mediaFiles[i]);
		 //  uploadFile(mediaFiles);
        //}       
   // }

    // Called if something bad happens.
    // 
    function captureError(error) {
        var msg = 'An error occurred during capture: ' + error.code;
        navigator.notification.alert(msg, null, 'Uh oh!');
    }

    // A button will call this function
    //
   
   
   /* function captureVideo() {
		
		 
        // Launch device video recording application, 
        // allowing user to capture up to 2 video clips
        navigator.device.capture.captureVideo(captureSuccess, captureError, {limit: 2});
    }
	
	*/
	
	
	

    // Upload files to server
    function uploadFile4a(mediaFile) {
        var ft = new FileTransfer(),
            path = mediaFile.fullPath,
            name = mediaFile.name;


			var options = new FileUploadOptions();
            options.fileKey="file";
            options.fileName=mediaFile.name;
            options.mimeType="*/*";

            var params = new Object();
            params.value1 = "test";
            params.value2 = "param";

            options.params = params;


 
		  	ft.upload(fileURI, "http://www.exotoolz.com/components/services.cfc?method=emilio", win, fail, options);
	 }
	
	
	
	
	function success(f) {
   	 alert("Code = " + f.responseCode);
   	 alert(" Response = " + f.response);
   	 alert("Sent = " + f.bytesSent);
   		}
	function fail(error) {
   		 alert("An error has occurred: Code = " = error.code);
   	 }

	
	
	
	
	


	
	function uploadFile1(mediaFile) 
	{ 
    var upload_url =  "http://www.exotoolz.com/components/services.cfc?method=emilio"; 

    var options = new FileUploadOptions(); 
    options.fileName = mediaFile.name;
    options.mimeType = "*/*"; 
    options.chunkedMode = false; 

	path = mediaFile.fullPath;
	
    var params = new Object(); 
    params.caption = "This is a caption"; // 
document.getElementById('caption'); 
    params.rider = "my_family"; 
    params.format = "video"; 

    options.params = params; 


		
		var ft = new FileTransfer();
		var options = new FileUploadOptions();
		    options.fileKey="document";
		    options.params={};
		    options.fileName =  fileName;
		    options.params.fileName = options.fileName ;
		    options.chunkedMode = true;
		ft.upload(fileURI, upload_url,function(result){alert("Video Upload Succes");}, 
        function(error){alert("Video Fail");}, 
        options);
		
		
/*
    var ft = new FileTransfer(); 
    console.log("Before Video Upload: " + theImage); 

    ft.upload(path, upload_url, 
        function(result){alert("Video Upload Succes");}, 
        function(error){alert("Video Fail");}, 
        options); 
        
        */
		
		
 } 
	




function checkConnection() {
        alert(navigator.network);
        if(navigator.network==undefined) {
            window.localStorage.setItem("internetAccessFlag","false");
        } else {
            var networkState = navigator.network.connection.type;
            var states = {};
            states[Connection.UNKNOWN]  = 'Unknown connection';
            states[Connection.ETHERNET] = 'Ethernet connection';
            states[Connection.WIFI]     = 'WiFi connection';
            states[Connection.CELL_2G]  = 'Cell 2G connection';
            states[Connection.CELL_3G]  = 'Cell 3G connection';
            states[Connection.CELL_4G]  = 'Cell 4G connection';
            states[Connection.NONE]     = 'No network connection';

            if(networkState==Connection.UNKNOWN || networkState==Connection.NONE) {
                window.localStorage.setItem("internetAccessFlag","false");
            } else {
                window.localStorage.setItem("internetAccessFlag","true");   
            }
            //alert(window.localStorage.getItem("internetAccessFlag"));
        }
    }
	
	

		
		
		
 
 	// uploadPhoto called b getImage function
        function uploadPhoto(imageURI) {
            var options = new FileUploadOptions();
            options.fileKey="file";
            options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
		    //options.fileName="image.jpg";
            options.mimeType="image/jpg";
			//options.mimeType = "text/plain";
			options.chunkedMode = true;
 
            var params = new Object();
            params.value1 = "test";
            params.value2 = "param";
			
			
 
            options.params = params;
            options.chunkedMode = false;
 
 		// alert ( "test"  );
   
 
            //var mediafile  = navigator.camera.DestinationType.FILE_URI;  // path to file
           // var method = "post";
			//ßßuploadFile(mediafile, method); 
			
			 
            var ft = new FileTransfer();
		  	ft.upload(imageURI, "http://www.exotoolz.com/components/services.cfc?method=emilio", win, fail, options);
			//alert ("uploaded" + r.responseCode + r.response+ r.bytesSent + r.response );
        }
 
 
 
 
        function win(r) {
            console.log("Code = " + r.responseCode);
            console.log("Response = " + r.response);
            console.log("Sent = " + r.bytesSent);
            alert(r.response);
        }
 
        function fail(error) {
            alert("An error has occurred " + error.code );
        }
		
		
		
		
		
		
		
					
					
    function onPhotoURISuccess(imageURI) {
                uploadFile(imageURI,"library");
    }
    function getVideo(source, type) {
            navigator.camera.getPicture(onPhotoURISuccess, onFail, { quality:
			50, destinationType: destinationType.FILE_URI, sourceType: source,
			mediaType: type});
    }
    function onFail(message) {
        alert('Error');
    }
		
		

// Overwrites the default behavior of the device back button
function onBackPress(e) {
    
    // Skip application history and exit application if the home page (menu page) is active
    if($.mobile.activePage.is("#home_page")){
        
        e.preventDefault();
        removeTemporaryFiles();
        navigator.app.exitApp();
    }
    else {
        
        // Do not save new cameraOptions and restore the previous state of the "settings_form" visual elements
        if ($.mobile.activePage.is("#settings_page")) {
            restoreSettings();
        }
        
        navigator.app.backHistory();
    }
}

// Removes all temporary files created by application. Is to be used when temporary files are not intended to be operated with further
function removeTemporaryFiles() {
    
    if (isIOS()) {
        
        // Currently camera.cleanup() seems not to remove files on iPad, iOS 5 and 6 (though onSuccess() function is called, 
        // as well as in the case of other PhoneGap file-remove operations).
        // Temporary directory is removed on application exit (e.g. on device switch off).
        //
        // navigator.camera.cleanup(onSuccess, onError); 
    }
    
    function onSuccess() {  }
    function onError(message) {  }
}

// Calls camera.getPicture() with cameraOptions customised by user
function onCapture(e) {
	
	   
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
    }
    
    navigator.camera.getPicture(onCaptureSuccess, onCaptureError, { quality : settings.quality, 
                                                                    destinationType : settings.destinationType, 
                                                                    sourceType : settings.sourceType, 
                                                                    allowEdit : settings.allowEdit, 
                                                                    encodingType : settings.encodingType,
                                                                    targetWidth : settings.targetWidth,
                                                                    targetHeight : settings.targetHeight,
                                                                    mediaType: settings.mediaType,
                                                                    saveToPhotoAlbum : settings.saveToPhotoAlbum,
                                                                    correctOrientation: settings.correctOrientation,
                                                                    popoverOptions : settings.popoverOptions
                                                                  });
																  
																  
					  
}








		
		

// Shows photo captured by camera.getPicture()
function onCaptureSuccess(imageData) {
    
    var photo = getElement("pic");
	
    photo.style.display = "block";
    photo.src = imageData;
    $.mobile.changePage("#result_page", "slideup");
	

	
	// get photo
	//  getImage(photo);
	
}

// camera.getPicture() callback function that provides an error message  
function onCaptureError(message) { }

// Reads customized camera options from the settings_form and saves them to the settings object (cameraOptions storage)
function applySettings() {
    
    var settingsBatch = getElement("settings_form");
    if (settingsBatch == null) {
        return;
    }
        
    var newQuality = parseInt(settingsBatch.elements["quality_input"].value, 10);
    if (!isNaN(newQuality) && (newQuality <= 100) && (newQuality >= 0)) {
        settings.quality = newQuality;
    }
        
    var newWidth = parseInt(settingsBatch.elements["width_input"].value, 10);
    if (!isNaN(newWidth) && (newWidth <= 1500) && (newWidth >= 50)) {
        settings.targetWidth = newWidth;
    }
    
    var newHeight = parseInt(settingsBatch.elements["height_input"].value, 10);
    if (!isNaN(newHeight) && (newHeight <= 1500) && (newHeight >= 50)) {
        settings.targetHeight = newHeight;
    }
    
    settings.allowEdit = settingsBatch.elements["edit_input"].checked;
    settings.correctOrientation = settingsBatch.elements["orient_input"].checked;
    settings.saveToPhotoAlbum = (settingsBatch.elements["save_input"].options[settingsBatch.elements["save_input"].selectedIndex].value == "true") ? true : false;
    settings.encodingType = parseInt(settingsBatch.elements["encod_input"].options[settingsBatch.elements["encod_input"].selectedIndex].value, 10);
    settings.mediaType = parseInt(settingsBatch.elements["media_input"].options[settingsBatch.elements["media_input"].selectedIndex].value, 10);
    
    fillSettingsInfo("settings_info");
}

// Applies camera options stored in the settings object to the settings_form and updates visible form elements accordingly.
// Is to be used when the user changes the settings_form elements state but does not intend to "save" this changes
function restoreSettings() {
    
    $("#quality_input").val(settings.quality).slider("refresh");
    $("#width_input").val(settings.targetWidth).slider("refresh");
    $("#height_input").val(settings.targetHeight).slider("refresh");
    
    if (settings.allowEdit) {
        $("#edit_input").attr("checked", true).checkboxradio("refresh");
    } else {
        $("#edit_input").removeAttr("checked").checkboxradio("refresh");
    }
    
    if (settings.correctOrientation) {
        $("#orient_input").attr("checked", true).checkboxradio("refresh");
    } else {
        $("#orient_input").removeAttr("checked").checkboxradio("refresh");  
    }
    
    var saveSwitch = $("#save_input");
    saveSwitch[0].selectedIndex = ((settings.saveToPhotoAlbum === true) ? 1 : 0);
    saveSwitch.slider("refresh");
    
    $("#encod_input").val(settings.encodingType).selectmenu("refresh");
    $("#media_input").val(settings.mediaType).selectmenu("refresh");
} 

// Retrieves the underlying HTML DOM element from the event fired on jQuery element 
function getTargetId(event, tagName) {
    var target = (event.target.tagName == tagName)
                    ? event.target
                    : $(event.target).closest(tagName)[0]
    return target.id;
}

// Retrieves the HTML DOM element by the element id or returns the element if the element itself was sent to the function. 
function getElement(element) {
    
    if(typeof(element) == "string") {
    
        element = document.getElementById(element);
    }
    
    return element;
} 

// Fills the table providing information on current used cameraOptions
function fillSettingsInfo(infoDivName) {
    
    var settingsBatch = getElement("settings_form");
    if (settingsBatch == null) {
        return;
    }
    
    var settingsInfo = getElement(infoDivName);
    if (typeof Camera === "undefined") {
        settingsInfo.innerHTML = "<h3 style='text-decoration: underline;'>The Cordova Camera API is inaccessible</h3>";
    }
    else {
        settingsInfo.innerHTML = "";
    }
    
    if (settingsInfo != null) {
        settingsInfo.innerHTML += "<h3>Settings: </h3>" +
                                 "<table>" +
                                 "<tr><td class='bh'>Editing options: </td></tr>" + 
                                 "<tr><td class='bi'>Quality:</td><td>" + settings.quality + " of 100</td></tr>" +
                                 "<tr><td class='bi'>Target picture width:</td><td>" + settings.targetWidth + " px</td></tr>" +
                                 "<tr><td class='bi'>Target picture height:</td><td>" + settings.targetHeight + " px</td></tr>" +
                                 "<tr><td class='bi'>Allow picture zoom and crop:</td><td>" + ((settings.allowEdit == true) ? "Yes" : "No") + "</td></tr>" + 
                                 "<tr><td class='bi'>Correct orientation:</td><td>" + ((settings.correctOrientation == true) ? "Yes" : "No") + "</td></tr>" +
                                 "<tr><td class='bh'>Saving options: </td></tr>" + 
                                 "<tr><td class='bi'>Target encoding type:</td><td>" + settingsBatch.elements["encod_input"].options[settings.encodingType].innerHTML + "</td></tr>" +
                                 "<tr><td class='bi'>Save to Photo Album:</td><td>" + ((settings.saveToPhotoAlbum == true) ? "Yes" : "No") + "</td></tr>" +
                                 "<tr><td class='bh'>Opening options: </td></tr>" + 
                                 "<tr><td class='bi'>Browse on open:</td><td>" + settingsBatch.elements["media_input"].options[settings.mediaType].innerHTML + "</td></tr>" +
                                 "</table>";
    }
}

// Determines whether the current device is running iOS
function isIOS() {

    var iDevices = ["iPad", "iPhone", "iPod"];

    for (var i = 0; i < iDevices.length ; i++ ) {
        
        if( navigator.platform.indexOf(iDevices[i]) !== -1){ 
            return true; 
        }
    }
    return false;
}