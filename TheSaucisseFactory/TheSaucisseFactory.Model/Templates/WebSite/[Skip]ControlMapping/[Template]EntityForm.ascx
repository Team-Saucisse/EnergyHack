[%@ template language="CSharp" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
[%@ namespace name="System.IO" %]
[%@ mapping definition="true" %]<%@ Control Language="C#" %>
<%@ Register TagPrefix="_cfwc" Namespace="CodeFluent.Runtime.Web.UI.WebControls" Assembly="CodeFluent.Runtime.Web"%>
<%@ Register TagPrefix="_cfw" Namespace="CodeFluent.Runtime.Web.UI" Assembly="CodeFluent.Runtime.Web"%><%-- Generated for Culture:[%=Culture.Name%] --%>[%
Producer.WriteReferences(Writer, Culture, TargetPath, ControlDefinition);
View view = Producer.GetView(ControlDefinition);
Entity entity = view.Entity;
string rowVersionName = Producer.GetRowVersionPropertyName(view.Entity);
%]
<[%=Producer.GetPrefix(Context, TargetPath, entity, "Form")%][%=entity.Name%]Form runat="server" commandName="" id="[%=entity.Name%]Form">
[% foreach(Method method in entity.LoadMethods){ if (!method.UIEnabled) continue; if (method.Parameters.Count > 0) {;%]
<case commandName="[%=method.UniqueReadableName%]" autoBind="false" bindToAction="true">
	<!-- [%=method.DisplayName%] -->
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	[% foreach(MethodParameter parameter in method.Parameters) {
		TypedObject obj = new TypedObject(Culture, parameter);
	%]<tr><td class="cf-loadName">[%=obj.NameDescription%]<br>([%=obj.TypeDescription%])</td><td class="cf-loadValue">[%Producer.WriteControlRenderer(Writer, Context, ControlDefinition, obj, TargetPath, RendererType.Parameter);%]</td></tr>
	[%}%]
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2">[%Producer.WriteControl(Writer, Context, ControlDefinition, TargetPath, "<asp:Button class='cf-loadButton' runat='server' text='Search'/>");%]</td></tr>
	</table>
</case><!-- [%=method.DisplayName%] -->
[% } else { %]
<case commandName="[%=method.UniqueReadableName%]" autoBind="true" bindToAction="false">
	<!--- [%=method.DisplayName%] -->
</case>
[% }} %]
<case commandName="FormEdit" autoBind="false" bindToAction="true" actionIdList="UpdateButton,CancelButton">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="2">[%Producer.WriteControl(Writer, Context, ControlDefinition, TargetPath, "<asp:Button runat='server' id='UpdateButton' text='Update'/>");%]&nbsp;[%Producer.WriteControl(Writer, Context, ControlDefinition, TargetPath, "<asp:Button runat='server' text='Cancel' id='CancelButton' commandName='Cancel'/>");%]</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr style='display:none'><td><asp:Label runat='server' id="_cfek_EntityKey"/></td></tr>
	[% if (rowVersionName != null) {TypedObject tso = TypedObject.CreateRowVersion(view.Entity);%]<tr style='display:[%=Producer.MustShowRowVersion?"inline":"none"%];'><td class="cf-updateName">RowVersion</td><td class="cf-updateValue">[%Producer.WriteControlRenderer(Writer, Context, ControlDefinition, tso, TargetPath, RendererType.Write);%]</td></tr>[%}%]
	[% foreach(ViewProperty viewProperty in view.Properties) {
	TypedObject obj = new TypedObject(Culture, viewProperty);
	%]
	<tr><td class="cf-updateName">[%=obj.NameDescription%]</td><td class="cf-updateValue">[%Producer.WriteControlRenderer(Writer, Context, ControlDefinition, obj, TargetPath, RendererType.Write);%]</td></tr>
	[% } %]
	</table>
</case><!-- FormEdit -->
<case commandName="New" autoBind="false" bindToAction="true">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="2">[%Producer.WriteControl(Writer, Context, ControlDefinition, TargetPath, "<asp:Button runat='server' text='Create'/>");%]</td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	[% foreach(Property property in entity.AllProperties) {
	if (!property.UIEnabled) continue;
	if (!property.IsModel) continue;
	if (property.IsGeneratedKey) continue;
	if (property.IsSet) continue;
	TypedObject obj = new TypedObject(Culture, property);
	%]
	<tr><td class="cf-newName">[%=obj.NameDescription%]</td><td class="cf-newValue">[%Producer.WriteControlRenderer(Writer, Context, ControlDefinition, obj, TargetPath, RendererType.Create);%]</td></tr>
	[% } %]
	</table>
</case><!-- New -->
<case commandName="Read" autoBind="false">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	[% foreach(ViewProperty viewProperty in view.Properties) {
	TypedObject obj = new TypedObject(Culture, viewProperty);
	%]
	<tr><td class="cf-readName">[%=obj.NameDescription%]</td><td class="cf-readValue">[%Producer.WriteControlRenderer(Writer, Context, ControlDefinition, obj, TargetPath, RendererType.Read);%]</td></tr>
	[% } %]
	</table>
</case><!-- Read -->
</[%=Producer.GetPrefix(Context, TargetPath, entity, "Form")%][%=entity.Name%]Form>