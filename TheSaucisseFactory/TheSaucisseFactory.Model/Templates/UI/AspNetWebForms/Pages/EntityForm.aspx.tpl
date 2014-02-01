[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "Form" + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
<%@ Page Title="[%=DisplayName(entity)%] Form" Language="C#" MasterPageFile="~/Dialog.master" AutoEventWireup="true" CodeBehind="[%=entity.Name%]Form.aspx.cs" Inherits="[%=Producer.WebNamespace(entity)%].[%=entity.Name%]Form" %>
<asp:Content runat="server" ContentPlaceHolderID="Header">
	<div class="dialogtitle">
	<% switch (EntityFormView.ModeFromArg(Request["mode"])) {
		case FormViewMode.Edit:%>
		<asp:literal runat="server" Text="<%$ Resources:WebResources, Modify %>" /> [%=DisplayName(entity)%]
		<%break;
		case FormViewMode.ReadOnly:%>
		<asp:literal runat="server" Text="<%$ Resources:WebResources, View %>" /> [%=DisplayName(entity)%]
		<%break;
		default:%>
		<asp:literal runat="server" Text="<%$ Resources:WebResources, AddNew %>" /> [%=DisplayName(entity)%]
		<%break;}%>
		[%if (GetVisibleForms(entity).Count > 1) {%]
		<div class="dialogviews"><asp:literal runat="server" Text="<%$ Resources:WebResources, ChooseForm %>" />:<cfe:DropDownList runat="server" AutoPostBack="true" AutoPostBackQueryStringParameter="form">
			[%foreach(VisibleForm form in GetVisibleForms(entity)) {%]<asp:ListItem Text="[%=form.DisplayName%]" Value="[%=form.IdentifierName%]" />[%}%]
			</cfe:DropDownList></div>
		[%}%]
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="dialogcontent">
		<cfe:EntityDataSource runat="server" ID="DataSource" TypeName="[%=entity.ClrFullTypeName%]" AutoParametersModes="Form, QueryString" AutoParametersPrefix="_p_" Method="LoadByEntityKey" />
		
		[%foreach(VisibleForm form in GetVisibleForms(entity)) {%]
		<cfe:EntityFormView runat="server" ID="[%=form.IdentifierName%]Form" Visible="false" DefaultMode="Insert" Width="100%" DataSourceID="DataSource" AutoChangeMode="true" AutoChangeModeParameter="mode" DataKeyNames="[%=KeyNames(entity)%]"
			AutoBind="true"
			OnItemInserted="OnItemInserted" OnItemUpdated="OnItemUpdated">
			<InsertItemTemplate>
				[%WriterOptions.Mode = FormMode.Insert;Write(form.Form);%]
				<div class="dialogbuttons">
					<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" />
					<input type="button" onclick="window.returnValue=false;window.close();" value="Cancel" />
				</div>
			</InsertItemTemplate>
			<EditItemTemplate>
				[%WriterOptions.Mode = FormMode.Edit;Write(form.Form);%]
				<div class="dialogbuttons">
					<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" />
					<input type="button" onclick="window.returnValue=false;window.close();" value="Cancel" />
				</div>
			</EditItemTemplate>
			<ItemTemplate>
				[%WriterOptions.Mode = FormMode.ReadOnly;Write(form.Form);%]
				<div class="dialogbuttons">
					<input type="button" onclick="window.returnValue=false;window.close();" value="Close" />
				</div>
			</ItemTemplate>
		</cfe:EntityFormView>
		[%}%]
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Footer">
</asp:Content>
