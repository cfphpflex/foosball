<cfset attributes.valid = "yes">

<cfset nameConflict="overwrite">

<cfif task IS "Edit">
    <cfif NOT IsDefined("attributes.xml_files_id_int")>
	<cfset attributes.error_message = attributes.error_message & "<br>Please select a file to edit.">
	<cfset attributes.valid = "no">
    <cfelse>
      <cftry>
   	<cfinclude template="qry_get_xml_file.cfm">
        <cffile action="read" file="#storeFolderPath##get_xml_file.xml_filename_vc#" variable="attributes.fileText">
        <cfset attributes.xml_filename_vc = "#get_xml_file.xml_filename_vc#">
        <cfset attributes.description_vc = "#get_xml_file.description_vc#">
       <cfcatch type="any">         
		<cfset attributes.error_message = attributes.error_message & "<br>The XML File name cannot be found.">
		<cfset attributes.valid = "no">
       </cfcatch>
      </cftry>	
    </cfif>
</cfif>

<cfif task IS "ImportXML"> 
  <cfif NOT Len(Trim(attributes.xml_filename_vc))>
	<cfset attributes.error_message = attributes.error_message & "<br>Please specify an XML Filename to import.">
	<cfset attributes.valid = "no">
  </cfif>	
  <cfif NOT Len(Trim(attributes.description_vc))>
	<cfset attributes.error_message = attributes.error_message & "<br>Please specify XML file description.">
	<cfset attributes.valid = "no">
  </cfif>	

  <cfinclude template="act_get_xml_file_by_desc.cfm">
  
  <cfif attributes.valid>

        <cftry>

         <cfif NOT DirectoryExists(storeFolderPath)>
                 <cfdirectory action="CREATE" directory="#storeFolderPath#">
         </cfif>
         <cffile action="upload"
                 fileField="xml_filename_vc"
                 destination="#storeFolderPath#"
                 nameConflict="#nameConflict#"
                 mode="644"
		 accept = "text/xml"                       	
                 attributes="normal">

         <cfset attributes.xml_filename_vc = file.serverfile>
         <cfset XMLFileName = #storeFolderPath# & #attributes.xml_filename_vc#>

         <cffile action="read" file="#XMLFileName#" variable="attributes.fileText">
         
         <cfcatch type="any">         
		<cfset attributes.error_message = attributes.error_message & "<br>Error while uploading XML file">
		<cfset attributes.valid = "no">
	 </cfcatch>
        </cftry>	

        <cfif attributes.valid>
         <cftry>
                   <cfset xsltFileName = #storeFolderPath# & #Replace(attributes.xml_filename_vc, ".xml", ".xsl")#>
	           <cffile action="read" file="#xsltFileName#" variable="attributes.xsltText">
	           <cfcatch type="any">         
		        <cfset attributes.warning = "Warning - an associated XSL format file was not found.  A generic format will be used">
  		   </cfcatch>
         </cftry>	
         <cfif NOT IsDefined("attributes.warning")>
		 <cfinclude template="act_transform.cfm">
	 </cfif>
	</cfif>
  </cfif>
	
</cfif>

<cfif task IS "UploadXSLT">

    <cfif NOT Len(Trim(attributes.xslt_filename_vc))>
	<cfset attributes.error_message = attributes.error_message & "<br>Please specify an XSL filename to import.">
	<cfset attributes.valid = "no">
    </cfif>	

  <cfif attributes.valid>
        <cftry>

          <cfif NOT DirectoryExists(storeFolderPath)>
                 <cfdirectory action="CREATE" directory="#storeFolderPath#">
          </cfif>
          <cffile action="upload"
                 fileField="xslt_filename_vc"
                 destination="#storeFolderPath#"
                 nameConflict="#nameConflict#"
                 mode="644"
		 accept = "text/xml"
                 attributes="normal">

          <!---
          <cfinclude template="qry_get_xml_file.cfm">
	  <cfset attributes.description_vc = "#get_xml_file.description_vc#">
          <cfset source = #storeFolderPath# & file.serverfile>
          <cfset attributes.xslt_filename_vc = #get_xml_file.xml_filename_vc# & ".xsl">
          <cfset XSLTFileName = #storeFolderPath# & attributes.xslt_filename_vc> 
          <cffile action="rename"
  		 source = "#source#"   
                 destination = "#XSLTFileName#" 
                 mode="644"
                 attributes="normal">
          --->
          <cfset attributes.description_vc = "">
          <cfset attributes.xslt_filename_vc = file.serverfile>
          <cfset XSLTFileName = #storeFolderPath# & attributes.xslt_filename_vc>
          <cffile action="read" file="#XSLTFileName#" variable="attributes.fileText">                    

         <cfcatch type="any">
      	   <cfset attributes.error_message = attributes.error_message & "<br>Error while uploading XSL file">
 	   <cfset attributes.valid = "no">
	 </cfcatch>
        </cftry>	        
    </cfif>
</cfif>


