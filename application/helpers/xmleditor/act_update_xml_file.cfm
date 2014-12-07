
<cfset xmlText = #attributes.XMLEditor#>      

<cffile action="write" file="#storeFolderPath##attributes.xml_filename_vc#" output="#xmlText#">

<cfquery name="set_xml_file" datasource="#request.dsn#">
 	UPDATE XML_Files SET
	       		description_vc = '#attributes.description_vc#'
    	WHERE
            		xml_files_id_int = #attributes.xml_files_id_int#
</cfquery>	



