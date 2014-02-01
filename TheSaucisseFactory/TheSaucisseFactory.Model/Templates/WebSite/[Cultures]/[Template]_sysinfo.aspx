<%@ Import Namespace="System.Collections.Generic" %>
<%@ Page Language="C#"%>
<html>
<head>
<title>System Information</title>
<style type="text/css">body{font-family:verdana;font-size:11px}td{padding-right:15px;font-size:11px}</style>
</head>
<body>
<table border="1">
<tr><th>Variable</th><th>Value</th></tr>
<%foreach(CodeFluent.Runtime.Utilities.Pair<string, string> pair in CodeFluent.Runtime.Web.Utilities.WebUtilities.GetSystemInformation()){%>
<tr><td><%=pair.First%></td><td><%=pair.Second%></td></tr>
<%} %>
</table>
</body>
</html>
