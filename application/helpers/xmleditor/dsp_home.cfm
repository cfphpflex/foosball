
<!--- return url used for the 'save and return' btn on item view/edit --->
<cflock scope="session" type="EXCLUSIVE" timeout="5">
	<cfif isDefined("attributes.page")>
		<cfset session.admin_returnurl = "#CGI.Path_Info#?fuseaction=xmlContentMgmtCategories.home&search_criteria=2&page=#attributes.page#&maxrecords=#attributes.maxrecords#">
	<cfelse>
		<cfset session.admin_returnurl = "#CGI.Path_Info#?fuseaction=xmlContentMgmtCategories.home&search_criteria=2">
	</cfif>
	<cfset session.admin_internalReturnUrl = session.admin_returnurl>
</cflock>

<script language="JavaScript">
    function toggle() {
    	if (document.forms['mainform'].elements['task'][0].checked == true) 
    	         {
			document.all.item('description_lbl').style.display = 'none';
      			document.mainform.description_vc.style.display = 'none';
			document.all.item('xml_filename_lbl').style.display = 'none';
      			document.mainform.xml_filename_vc.style.display = 'none';
			document.all.item('xslt_filename_lbl').style.display = 'none';
   			document.mainform.xslt_filename_vc.style.display = 'none';
			document.all.item('overwrite_lbl').style.display = 'none';
		        document.mainform.overwrite.style.display = 'none';
    		 } 
    	else if (document.forms['mainform'].elements['task'][1].checked == true) 
    	         {
			document.all.item('description_lbl').style.display = '';
      			document.mainform.description_vc.style.display = '';
			document.all.item('xml_filename_lbl').style.display = '';
      			document.mainform.xml_filename_vc.style.display = '';
			document.all.item('xslt_filename_lbl').style.display = 'none';
   			document.mainform.xslt_filename_vc.style.display = 'none';
			document.all.item('overwrite_lbl').style.display = '';
		      	document.mainform.overwrite.style.display = '';
    		 } 
   	else if (document.forms['mainform'].elements['task'][2].checked == true) 
    		 {
			document.all.item('description_lbl').style.display = 'none';
      			document.mainform.xml_filename_vc.style.display = 'none';
			document.all.item('xml_filename_lbl').style.display = 'none';
      			document.mainform.description_vc.style.display = 'none';
			document.all.item('xslt_filename_lbl').style.display = '';
      			document.mainform.xslt_filename_vc.style.display = '';
			document.all.item('overwrite_lbl').style.display = 'none';
                    	document.mainform.overwrite.style.display = 'none';
    		 }
    }
</script>                  

<cfinclude template="qry_get_xml_files.cfm">

<cfoutput>

<cfif IsDefined("attributes.error_message") AND Len(Trim(attributes.error_message))>
	<div class="errorText">
		#attributes.error_message#
	</div>
	<br>
</cfif>

<!---<cfdump var="#get_xml_files#"><cfabort/> --->

<div class="contentBorderOuter" style="width: 60%;">
	<div class="contentBorderInner" style="padding: 0px; align: center;">
	<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
	<tr>
		<td class="Header" width="100%" colspan="2">Files</td>
        </tr>
	<tr>
		<td width="100%" colspan="2" align="center">
			<p class="alert" style="width: 95%;">Please select a file and an action. Then press 'Submit.'</p>			
		</td>
        </tr>
        
        <form action="#request.self#?fuseaction=xmlContentMgmtCategories.process" method="post" name="mainform" enctype="multipart/form-data">

	<tr>
         <cfif get_xml_files.recordcount>      	
      		<td valign="top" class="titleFormField">Files: </td>
      		<td valign="top">
      			<select name="xml_files_id_int" size="10" style="font-size: 11pt;">
      				<cfloop query="get_xml_files">
      					<option value="#xml_files_id_int#"<cfif IsDefined("attributes.xml_files_id_int") AND attributes.xml_files_id_int eq xml_files_id_int> selected</cfif>>#description_vc#</option>
      				</cfloop>
      			</select>
      		</td>      	
      	 <cfelse>
		<td width="100%" colspan="2" align="center">
			<p class="alert" style="width: 95%;">No files to select</p>			
		</td>
         </cfif>
	</tr>

	<tr>
		<td class="titleFormField"><span id="description_lbl">Description:</span></td>
		<td>
			<input type="text" name="description_vc" size="50" value=""/>
		</td>
	</tr>
	<tr>
		<td class="titleFormField"><span id="xml_filename_lbl">XML File:</span></td>
		<td>
			<input type="file" name="xml_filename_vc" size="30" value="">
		</td>
	</tr>
	<tr>
		<td class="titleFormField"><span id="xslt_filename_lbl">XSLT File:</span></td>
		<td>
			<input type="file" name="xslt_filename_vc" size="30" value="">
		</td>
	</tr>

	<tr>
		<td class="titleFormField">Action:</td>
		<td>
			    <cfif get_xml_files.recordcount>
			        <cfset checked = "checked">
			    <cfelse>
    			        <cfset checked = ""> 
			    </cfif>	
		            <input type="radio" name="task" value="Edit" #checked# onClick="toggle();">Edit Content
			    <input type="radio" name="task" value="ImportXML" <cfif NOT get_xml_files.recordcount>checked</cfif> onClick="toggle();">Import new file
			    <input type="radio" name="task" value="UploadXSLT" onClick="toggle();">Upload new XSLT file
		</td>
	</tr>

	<tr>
		<td align="center" colspan="2">
		            <input type="checkbox" name="overwrite"><span id="overwrite_lbl">Overwrite with the same description?</span>
		</td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td>
			<input type="submit" name="submit" value="Submit" class="btn">
		</td>
	</tr>
	</table>
	</div>
    </div>
</form>

<script language="JavaScript">        
	<cfif get_xml_files.recordcount>
 	  document.mainform.task[0].checked = 'true';
          document.all.item('description_lbl').style.display = 'none';
     	  document.mainform.description_vc.style.display = 'none';
       	  document.all.item('xml_filename_lbl').style.display = 'none';
     	  document.mainform.xml_filename_vc.style.display = 'none';
       	  document.all.item('xslt_filename_lbl').style.display = 'none';
       	  document.mainform.xslt_filename_vc.style.display = 'none';
          document.all.item('overwrite_lbl').style.display = 'none';
       	  document.mainform.overwrite.style.display = 'none';
	<cfelse>
          document.mainform.task[1].checked = 'true';
          document.all.item('description_lbl').style.display = '';
     	  document.mainform.description_vc.style.display = '';
       	  document.all.item('xml_filename_lbl').style.display = '';
     	  document.mainform.xml_filename_vc.style.display = '';
       	  document.all.item('xslt_filename_lbl').style.display = '';
       	  document.mainform.xslt_filename_vc.style.display = '';
	  document.all.item('overwrite_lbl').style.display = 'none';
       	  document.mainform.overwrite.style.display = 'none';
        </cfif>
</script>

</cfoutput>
