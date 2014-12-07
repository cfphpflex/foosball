<cfset Attributes.xml="#attributes.fileText#">
<cfset Attributes.xslt="#XSLTFileName#">

<cfset Attributes.xml = ReplaceNoCase(Attributes.xml, '<?xml version="1.0"?>', "")>
<cfobject class="MSXML2.DOMDocument.4.0" Action="Create" name="xmldoc">
<cfobject class="MSXML2.DOMDocument.4.0" Action="Create" name="xsldoc">

<cfset x = xmldoc.loadXML(Attributes.xml)>
<cfset error = 0>
<cfset error = xmldoc.parseerror.errorcode>
<cfif error NEQ 0>
	<cfset attributes.error_message = attributes.error_message & "<BR>Error loading XML Document - #xmldoc.parseerror.reason#">
        <cfset attributes.valid = "no">	
</cfif>

<!---<cfset variable.DestDir = GetDirectoryFromPath(GetCurrentTemplatePath())>
<cfset variable.DestDir = variable.DestDir & Attributes.xslt>--->
<cfset variable.DestDir = Attributes.xslt>
<cfset x= xsldoc.Load(variable.DestDir)>
<!--- Check for a successful load of the XSL Document. --->
<cfset error= 0>
<cfset error = xsldoc.parseerror.errorcode>
<cfif error NEQ 0>
	<cfset attributes.error_message = attributes.error_message & "<BR>Error loading XML Document - #xsldoc.parseerror.reason#">
        <cfset attributes.valid = "no">	
</cfif>

<cfset transformstring = xmldoc.TransformNode(xsldoc)>
<cfset attributes.fileText = #transformstring#>
<!---<cfdump var="#transformstring#">--->

<cfset xmldoc = "Nothing">
<cfset xsldoc = "Nothing">	



