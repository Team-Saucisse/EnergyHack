[%@ template language="CSharp"%]
[%@ namespace name="CodeFluent.Model.Code"%]
<%@ Page Language="C#" Inherits="[%=Producer.GetFullClassName("DataPage")%]" responseEncoding="[%=Producer.OutputEncoding.WebName%]" uiCulture="[%=Culture.Name%]" culture="[%=Culture.Name%]"%>
<%System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("[%=Culture.Name%]"); %>
<html xmlns:x="urn:schemas-microsoft-com:office:excel" lang="<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%=Response.ContentEncoding.WebName%>">
<meta name="KEYWORDS" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_keywords", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="DESCRIPTION" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_description", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="CATEGORY" content="[%=Producer.Project.AllMessages.GetMessageValue("web_header_category", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]" >
<meta name="MS.LOCALE" content="<%=System.Threading.Thread.CurrentThread.CurrentUICulture.Name%>" >
<title>CodeFluent</title>
<link rel="stylesheet" type="text/css" href="assets/default.css">
<style>
td
{
	white-space:nowrap;
}
  <!--table
  @page
     {mso-header-data:"&CMultiplication Table\000ADate\: &D\000APage &P";
	mso-page-orientation:landscape;}
     br
     {mso-data-placement:same-cell;}

  -->
  font-
</style>
  <!--[if gte mso 9]><xml>
   <x:ExcelWorkbook>
    <x:ExcelWorksheets>
     <x:ExcelWorksheet>
      <x:Name>Sample Workbook</x:Name>
      <x:WorksheetOptions>
       <x:Print>
        <x:ValidPrinterInfo/>
       </x:Print>
      </x:WorksheetOptions>
     </x:ExcelWorksheet>
    </x:ExcelWorksheets>
   </x:ExcelWorkbook>
  </xml><![endif]-->
</head>
<body>
<%WriteData();%>
</body>
</html>
<!-- powered by CodeFluent Entities (C) 2005-2013 SoftFluent S.A.S. www.softfluent.com . All rights reserved. -->
<% if (Request["cf-Format"] != "html")
{
	Response.ContentType = "application/vnd.ms-excel";
	Response.AddHeader("Content-Disposition", "inline; filename=\"" + FileName + "\"");
}
%>
