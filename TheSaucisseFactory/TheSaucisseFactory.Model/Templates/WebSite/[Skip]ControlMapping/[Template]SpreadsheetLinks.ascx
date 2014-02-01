[%@ template language="CSharp" %]
[%@ reference name="CodeFluent.Runtime.Office.dll" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
[%@ namespace name="System.IO" %]
[%@ mapping definition="true" %]<%@ Control Language="C#" %>
<%@ Register TagPrefix="_cfwc" Namespace="CodeFluent.Runtime.Web.UI.WebControls" Assembly="CodeFluent.Runtime.Web"%>
<%@ Register TagPrefix="_cfw" Namespace="CodeFluent.Runtime.Web.UI" Assembly="CodeFluent.Runtime.Web"%>
<%-- Generated for Culture:[%=Culture.Name%] --%>
[%
if (!Producer.IntegrateOfficeLists)
	return;

if (Producer.OfficeListProducer == null)
	return;
	
if (Producer.OfficeListProducer.GetOfficeListUrl(Culture.CultureInfo) == null)
	return;

Method method = Producer.GetMethod(ControlDefinition);
if (!Producer.OfficeListProducer.IsAvailableMethod(method))
	return;

%]<%@ Assembly Name="CodeFluent.Runtime.Office" %>
<tr><td><table border="0" cellpadding="0" cellspacing="0" width="100%">[%
	
string queryFile;
string dynamicParameters = null;
if (method.Parameters.Count > 0)
{
	queryFile = "office97";
	dynamicParameters = Producer.OfficeListProducer.BuildMethodParameters(Culture.CultureInfo, method);
}
else
{
	queryFile = "office2003";
}

foreach(View view in method.Entity.Views)
{
	if (!view.UIEnabled)
		continue;

	string name = method.Entity.Name + method.Name + view.Name + ".iqy";
	string defaultMessageValue = "Export to spreadsheet ('" + view.GetMessageValue(Message.DefaultClassName, Culture.CultureInfo) + "' view)";
%]
<tr><td>&nbsp;</td><td nowrap="nowrap"><a
class="cf-excelLink" title="[%=name%]"
href="<%=CodeFluent.Runtime.Office.SharePoint.Lists.ListsPage.GetQueryFileUrl(@"[%=Producer.OfficeListProducer.GetOfficeListUrl(Culture.CultureInfo)%]", "[%=method.PermanentModelId.ToString("B")%]", "[%=view.PermanentModelId.ToString("B")%]", "[%=name%]", "[%=queryFile%]", null, null, Request.IsSecureConnection [%=dynamicParameters%])%>"
>[%=Producer.Project.AllMessages.GetMessageValue("SpreadsheetExport", Culture.CultureInfo, defaultMessageValue, view.GetMessageValue(Message.DefaultClassName, Culture.CultureInfo))%]</a></td></tr>
[% }%]
</table></td></tr>
