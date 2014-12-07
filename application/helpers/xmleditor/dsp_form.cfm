
<cfoutput>
<cfset width = "90%">
<div class="contentBorderOuter" style="width: #width#;">
	<div class="contentBorderInner" style="padding: 0px; align: center;">
	<table width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

          <form action="#request.self#?fuseaction=xmlContentMgmtCategories.#task#" method="post" name="mainform">
                      	   
            <input type="hidden" name="overwrite" value="#IsDefined('attributes.overwrite')#">

            <cfif attributes.task IS "ImportXML">
                   <input type="hidden" name="save_editor_contents" value="#IsDefined('attributes.warning')#">
            <cfelse>
		   <input type="hidden" name="save_editor_contents" value="YES") 
            </cfif>
	     
            <cfif attributes.task IS "UploadXSLT">
		   <input type="hidden" name="xslt_filename_vc" value="#attributes.xslt_filename_vc#">           	   
            <cfelse>
	           <input type="hidden" name="xml_filename_vc" value="#attributes.xml_filename_vc#">		              
            </cfif>

            <cfif attributes.task IS "Edit">
            	   <input type="hidden" name="xml_files_id_int" value="#attributes.xml_files_id_int#">
            </cfif>

		<tr>
     		   <td valign="top" class="Heading">File contents:</td>
	      	</tr>
	      	<tr>
	      	  <td>&nbsp;</td>
	      	</tr>

	       <cfif attributes.task IS NOT "UploadXSLT">
	        <tr>
	         <td>
 	          <table>
          		<tr>
          			<td class="titleFormField">Description:</td>
        	  		<td>
          				<input type="text" name="description_vc" size="50" value="#attributes.description_vc#"/>
          			</td>
        	  	</tr>
		  </table>
		 </td>
	      	</tr>
	      	<tr>
	      	  <td>&nbsp;</td>
	      	</tr>
	      	</cfif>

		<tr>
      			<td valign="top">
			    <cf_ewebeditpro4 Name="XMLEditor" Width="100%" Height="500" Value="#attributes.fileText#">
	      		</td>      	
		</tr>
	        <cfif attributes.task IS NOT "Edit">
      			   <script language="JavaScript1.2">  			     	
				eWebEditPro.instances["XMLEditor"].setReadOnly(true);
 			   </script>
                </cfif>

                <tr> 	      
                       <td align="center">
                                       <cfset msg = "">
                                       <cfif attributes.task IS "ImportXML">
                                          <cfset msg = msg & "<br>Import XML?">
                                       <cfelseif attributes.task IS "UploadXSLT">
	  			          <cfset msg = msg & "<br>Upload XSL file?">
                                       </cfif>

                                       <b class="body">#msg#</b>				       				      
                                       <br><br>

                                       <cfif IsDefined("attributes.warning")>
                                       		<b style="color:red;">#attributes.warning#</b><br><br>
                                       </cfif>

			   	       <cfif attributes.task IS "ImportXML">
   	       				   <cfset submit= "Yes">
		   	       		   <cfset cancel= "No">
		   	       	       <cfelse>
   	       				   <cfset submit= "Save">
		   	       		   <cfset cancel= "Back">
		   	       	       </cfif>

		   	       	       <cfset cancelScript = "history.go(-1);">
			   	       <cfif attributes.task IS NOT "Edit">
                                         <cfif attributes.task IS "ImportXML">
                                             <cfset fileName = "#attributes.xml_filename_vc#">
                                         <cfelseif attributes.task IS "UploadXSLT">
                                             <cfset fileName = "#attributes.xslt_filename_vc#">     
                                         </cfif>
                                         <cfset cancelScript = cancelScript & "window.location.href='#request.self#?fuseaction=xmlContentMgmtCategories.delete&fileName=#fileName#';">
                                       </cfif>

                                       <input type="submit" name="submit" class="btn" value="#submit#">                               
                                       <input type="button" name="Back" class="btn" value="#cancel#" onclick="#cancelScript#">
                       </td>
                  </tr>
          </form>
	</table>
   </div>
</div>
</cfoutput>
