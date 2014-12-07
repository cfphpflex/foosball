<!---
<fusedoc fuse="FBX_Switch.cfm">
	<responsibilities>
		I am the cfswitch statement that handles the fuseaction, delegating work to various fuses.
	</responsibilities>
	<io>
		<string name="fusebox.fuseaction" />
		<string name="fusebox.circuit" />
	</io>	
</fusedoc>
--->

<cfinclude template="/commons/formValidation/validation.cfm"><!--- validation framework --->
<cfinclude template="../common/udfs/form.cfm"><!--- form field functions --->
<cfinclude template="../common/udfs/number.cfm"><!--- number formatting --->

<cfswitch expression = "#fusebox.fuseaction#">

	<cfcase value="home">
		<cfinclude template="dsp_home.cfm">
	</cfcase>

	<cfcase value="process">
		<cfinclude template="act_validate_parameters.cfm">
                <cfif attributes.valid>		
                	<cfinclude template="dsp_form.cfm">                
                <cfelse>
			<cfinclude template="dsp_home.cfm">                                   
                </cfif>
	</cfcase>
	
	<cfcase value="Edit">        	        
		<cfinclude template="act_update_xml_file.cfm">
		<cfinclude template="dsp_home.cfm">
	</cfcase>

	<cfcase value="Delete">        	
	        <cffile action="delete" file="#storeFolderPath##fileName#">
		<cfinclude template="dsp_home.cfm">
	</cfcase>

	<cfcase value="ImportXML">        	
   	        <cfinclude template="act_insert_xml_file.cfm">
		<cfinclude template="dsp_home.cfm">
	</cfcase>

	<cfcase value="UploadXSLT">        	
		<cfset XSLTText = #attributes.XMLEditor#>      
		<cffile action="write" file="#storeFolderPath##attributes.xslt_filename_vc#" output="#XSLTText#">
		<cfinclude template="dsp_home.cfm">
	</cfcase>
			
	<cfdefaultcase>
		<!---This will just display an error message and is useful in catching typos of fuseaction names while developing--->
		<cfoutput>This is the cfdefaultcase tag. I received a fuseaction called "#attributes.fuseaction#" and I don't know what to do with it.</cfoutput>
	</cfdefaultcase>

</cfswitch>
