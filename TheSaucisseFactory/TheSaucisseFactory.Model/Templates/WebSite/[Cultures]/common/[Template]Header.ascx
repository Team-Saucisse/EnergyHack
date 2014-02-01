[%@ template language="CSharp"%]
<%@ Control Language="C#" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html lang="[%=Culture.Name%]">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%=Response.ContentEncoding.WebName%>">
<meta name="CF_BUILDNUMBER" content="[%=Producer.Project.BuildNumber%]">
<meta name="KEYWORDS" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_keywords", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="DESCRIPTION" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_description", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="MS.LOCALE" content="[%=Culture.Name%]" >
<meta name="CATEGORY" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_category", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<title>[%=Producer.Project.DefaultNamespace%]</title>
<link rel="stylesheet" type="text/css" href="assets/<%=CodeFluent.Runtime.Web.Utilities.UrlHelper.Current.CurrentStylesheetName%>.css">
<link rel="stylesheet" type="text/css" href="assets/menu.css">
<script type="text/javascript" language="javascript" src="assets/sf_menu.js"></script>
<script type="text/javascript" language="javascript" src="_cf_menu.js"></script>
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
		<td><script type="text/javascript" language="javascript">SFCreateRootMenu(SFRootMenu);</script></td>
	</tr>
	<tr>
		<td>
