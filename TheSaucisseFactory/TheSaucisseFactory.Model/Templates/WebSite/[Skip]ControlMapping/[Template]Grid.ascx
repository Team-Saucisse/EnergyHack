[%@ template language="CSharp" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
[%@ namespace name="System.IO" %]
[%@ mapping definition="true" %]<%@ Control Language="C#" %>
<%@ Register TagPrefix="_cfwc" Namespace="CodeFluent.Runtime.Web.UI.WebControls" Assembly="CodeFluent.Runtime.Web"%>
<%@ Register TagPrefix="_cfw" Namespace="CodeFluent.Runtime.Web.UI" Assembly="CodeFluent.Runtime.Web"%><%-- Generated for Culture:[%=Culture.Name%] --%>[%
Producer.WriteReferences(Writer, Culture, TargetPath, ControlDefinition);%]
[%
View view = Producer.GetView(ControlDefinition);
string rowVersionName = Producer.GetRowVersionPropertyName(view.Entity);
%]
<[%=Producer.GetPrefix(Context, TargetPath, view.Entity, "Grid")%][%=view.Entity.Name%]Grid
runat="server"
autoGenerateColumns="false"
allowPaging="[%=(view.Entity.PagingMode != CodeFluent.Model.PagingMode.None)%]"
allowCustomPaging="[%=((view.Entity.PagingMode != CodeFluent.Model.PagingMode.None) && (view.Entity.PagingMode != CodeFluent.Model.PagingMode.UI))%]"
allowSorting="[%=(view.Entity.SortingMode != CodeFluent.Model.SortingMode.None)%]"
ItemStyle-CssClass="cf-column"
HeaderStyle-CssClass="cf-columnHeader"
KeyNameList="[%=CodeFluent.Producers.CodeDom.UI.Web.GridProducer.GetKeyNameList(view.Entity)%]"
LocalCommandList="[%=CodeFluent.Producers.CodeDom.UI.Web.GridProducer.GetLocalCommandList(view.Entity)%]">[%
if ((view.Entity.PagingMode != CodeFluent.Model.PagingMode.None) && (view.Entity.PagingMode != CodeFluent.Model.PagingMode.UI)) {
%]<PagerStyle CssClass="cf-searchPager" HorizontalAlign="Left" Position="TopAndBottom"
	Mode="NextPrev"
	NextPageText='[%=Producer.Project.AllMessages.GetMessageValue("Next", Culture.CultureInfo, "Next")%]'
	PrevPageText='[%=Producer.Project.AllMessages.GetMessageValue("Prev", Culture.CultureInfo, "Prev")%]'
	/>[%
} else {
%]<PagerStyle CssClass="cf-searchPager" HorizontalAlign="Left" Position="TopAndBottom"
	Mode="NumericPages"
	PageButtonCount="5"
	/>[% } %]
<Columns>[%
if (rowVersionName != null)
{
	Producer.WriteControlRenderer(Writer, Context, ControlDefinition, TypedObject.CreateRowVersion(view.Entity), TargetPath, RendererType.Column);
}
%]<asp:EditCommandColumn ButtonType="PushButton" HeaderText='[%=Producer.Project.AllMessages.GetMessageValue("Edit", Culture.CultureInfo, "Edit")%]'
EditText='[%=Producer.Project.AllMessages.GetMessageValue("Edit", Culture.CultureInfo, "Edit")%]'
CancelText='[%=Producer.Project.AllMessages.GetMessageValue("Cancel", Culture.CultureInfo, "Cancel")%]'
UpdateText='[%=Producer.Project.AllMessages.GetMessageValue("Update", Culture.CultureInfo, "Update")%]'
ItemStyle-CssClass="cf-editColumn"/>
<asp:ButtonColumn ButtonType="LinkButton" Text="&amp;nbsp;" HeaderText='[%=Producer.Project.AllMessages.GetMessageValue("FormEdit", Culture.CultureInfo, "Form Edit")%]' CommandName="FormEdit" ItemStyle-CssClass="cf-formEditColumn"/>
<asp:ButtonColumn ButtonType="LinkButton" Text="&amp;nbsp;" HeaderText='[%=Producer.Project.AllMessages.GetMessageValue("Read", Culture.CultureInfo, "Read")%]' CommandName="Read" ItemStyle-CssClass="cf-readColumn"/>
<asp:TemplateColumn HeaderText='[%=Producer.Project.AllMessages.GetMessageValue("Delete", Culture.CultureInfo, "Delete")%]' ItemStyle-CssClass="cf-deleteColumn">
	<ItemTemplate>
		<_cfwc:LinkButton Text="&amp;nbsp;" Runat="server" CommandName="Delete" OnClientClick="javascript:return window.confirm('[%=Producer.Project.AllMessages.GetMessageValue("DeleteConfirm", Culture.CultureInfo, "Are you sure?")%]')">
		</_cfwc:LinkButton>
	</ItemTemplate>
</asp:TemplateColumn>
[% foreach(ViewProperty viewProperty in view.Properties) {
	Producer.WriteControlRenderer(Writer, Context, ControlDefinition, new TypedObject(Culture, viewProperty), TargetPath, RendererType.Column);
%]
[% } %]
</Columns>
</[%=Producer.GetPrefix(Context, TargetPath, view.Entity, "Grid")%][%=view.Entity.Name%]Grid>
