[%@ template language="CSharp"%]
[%@ reference name="CodeFluent.Runtime.Web.dll"%]
[%@ namespace name="CodeFluent.Model.Code"%]
<%@ Page Language="C#" Inherits="CodeFluent.Runtime.Office.SharePoint.Lists.ListsPage" responseEncoding="[%=Producer.OutputEncoding.WebName%]" uiCulture="[%=Culture.Name%]" culture="[%=Culture.Name%]"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<%System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("[%=Culture.Name%]"); %>
<%System.Threading.Thread.CurrentThread.CurrentCulture = System.Threading.Thread.CurrentThread.CurrentUICulture; %>
<html lang="<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%=Response.ContentEncoding.WebName%>">
<meta name="KEYWORDS" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_keywords", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="DESCRIPTION" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_description", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="CATEGORY" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_category", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="MS.LOCALE" content="<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name%>" >
<title>CodeFluent</title>
<link rel="stylesheet" type="text/css" href="assets/lists.css">
<link rel="stylesheet" type="text/css" href="assets/menu.css">
</head>
<body>
	<div align="center"><div class="cf-root" id="sf-root">
	<table width="100%" cellspacing="2" cellpadding="0" border="0" bgcolor="#ffffff" align="center">
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr bgcolor="#FFFFFF">
				<td class="cf-logo"><a href="default.aspx" name="top"><img alt="SoftFluent Logo" src="assets/sflogo.gif" width="170" height="79" border="0" /></a></td>
				<td class="cf-logo" width="100%"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table  width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr valign="top">
				<td class="cf-dark" height="2"></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="cf-dark">&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	[%

	// advertise for other producers	
	Producer.AddOfficeListPath(Culture.CultureInfo, TargetPath);
	
	foreach(Entity entity in Producer.Project.Entities){
		if (!entity.IsPersistent)
			continue;
			
		if (!entity.UIEnabled)
			continue;
			
		if (!Producer.IsEnabled(entity))
			continue;
	%]
	<tr>
		<td><table  width="100%" cellspacing="0" cellpadding="0" border="0" class="cfl-entities">
			<tr>
				<td class="cfl-entity" colspan="2">&nbsp;&nbsp;
					[%=entity.GetMessageValue(Message.DefaultClassName, Culture.CultureInfo)%] [%if (!Producer.CanBeUpdated(entity)) Writer.Write("(Cannot be updated)");%]
				</td>
			</tr>
			[%foreach(Method method in Producer.GetAvailableMethods(entity)){
			
					string queryFile;
					string dynamicParameters = null;
					if (method.Parameters.Count > 0)
					{
						queryFile = "office97";
						dynamicParameters = Producer.BuildMethodParameters(Culture.CultureInfo, method);
					}
					else
					{
						queryFile = "office2003";
					}
				
			%]
			<tr>
				<td class="cfl-methodPad"><img border="0" src="assets/p.gif"></td>
				<td><table  width="100%" cellspacing="0" cellpadding="0" border="0" class="cfl-methods">
					<tr>
						<td class="cfl-method" colspan="2">
							[%=method.GetMessageValue(Message.DefaultClassName, Culture.CultureInfo)%] [%if (method.Parameters.Count >0) Writer.Write("(Readonly)");%]
						</td>
					</tr>
					
					[%foreach(View view in entity.Views){
						if (!view.UIEnabled)
							continue;
						
						string name = entity.Name + method.Name + view.Name + ".iqy";
					%]
					<tr>
						<td class="cfl-viewPad"><img border="0" src="assets/p.gif"></td>
						<td class="cfl-view">
							<a title="[%=name%]" href="<%=GetQueryFileUrl(System.IO.Path.GetFileName(Request.PhysicalPath), "[%=method.PermanentModelId.ToString("B")%]", "[%=view.PermanentModelId.ToString("B")%]", "[%=name%]", "[%=queryFile%]", null, null, Request.IsSecureConnection [%=dynamicParameters%])%>">[%=view.GetMessageValue(Message.DefaultClassName, Culture.CultureInfo)%]</a>
						</td>
					</tr>
					[%}%]
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><img border="0" src="assets/p.gif"></td>
			</tr>
			[%}%]
			</table>
		</td>
	</tr>
	[%}%]
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="cf-dark">&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="cf-dark" height=2></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0" class="cf-footer">
			<tr valign="top">
				<td>[%=Producer.Project.AllMessages.GetMessageValue("web_footer_description", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]<br><br></td>
				<td nowrap align="right"><p>[%=Producer.Project.AllMessages.GetMessageValue("web_footer_copyright", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]
				<br>[%foreach(Culture culture in Producer.Application.Cultures) {
						if (culture.Name == Culture.Name)
							continue;
						%]
					<br><a href="<%=CodeFluent.Runtime.Web.Utilities.UrlHelper.NewUrl("../[%=culture.Name%]/" + CodeFluent.Runtime.Web.Utilities.UrlHelper.Current.FileName)%>" style="font-weight:bolder">[%=culture.CultureInfo.NativeName%]</a>
					[%}%]
				<br>[%foreach(CodeFluent.Model.UI.Stylesheet sheet in Producer.Application.Stylesheets) {%]
					<br><a href='<%=CodeFluent.Runtime.Web.Utilities.UrlHelper.Current.AddParameters("cf-css", "[%=sheet.Name%]")%>' style="font-weight:bolder">[%=sheet.GetMessageValue(Culture.CultureInfo)%]</a>
					[%}%]
				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
	</div></div>
	</body>
</html>
<!-- powered by CodeFluent Entities (C) 2005-2013 SoftFluent S.A.S. www.softfluent.com . All rights reserved. -->