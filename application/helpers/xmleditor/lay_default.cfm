<cfinclude template="#fusebox.rootpath#include/dsp_header.cfm">


<cfparam name="tableWidth" default="95%">
<cfoutput>
<div align="center">
	<div align="right" style="padding: 5px; width: #tableWidth#;">
		<a href="#request.cfroot##request.self#?fuseaction=#fusebox["CIRCUIT"]#.main"><img src="images/icon_list.gif" alt="" width="15" height="16" hspace="3" border="0" align="absmiddle"></a><a href="#request.cfroot##request.self#?fuseaction=#fusebox["CIRCUIT"]#.home">List All</a>
	</div>

</cfoutput>

<!--- if msg on url, show it (for confirmation msgs) --->
<cfif IsDefined("url.msg") AND Len(Trim(url.msg)) AND url.msg IS NOT "zeroItems">
	<cfoutput>
		<br>
		<!--- <div style="color: red; font-weight:bold ">#url.msg#</div> --->
		<div style="width: #tableWidth#" class="errorText">
			#url.msg#
		</div>
		<br>
	</cfoutput>
</cfif>

<cfoutput>#fusebox.layout#</cfoutput>
<cfinclude template="#fusebox.rootpath#include/dsp_footer.cfm">
