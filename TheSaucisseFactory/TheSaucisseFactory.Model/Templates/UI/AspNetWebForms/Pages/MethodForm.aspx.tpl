[%@ template enumerable='Producer.VisibleMethodForms' enumerableItemName="form" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(form)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
<%@ Page Title="[%=DisplayName(form)%] Form" Language="C#" MasterPageFile="~/Dialog.master" AutoEventWireup="true" CodeBehind="[%=ClassName(form)%].aspx.cs" Inherits="[%=Producer.WebNamespace(form)%].[%=ClassName(form)%]" %>
<asp:Content runat="server" ContentPlaceHolderID="Header">
	<div class="dialogtitle">
		[%=new VisibleMethod(form.Method).DisplayName%]
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="dialogcontent">
		<cfe:FreeFormView runat="server" ID="FreeForm" AutoBind="true" DecamelizeOptions="None">
			<ItemTemplate>
				[%WriterOptions.Mode = FormMode.Insert;Write(form);%]
				<div class="dialogbuttons">
					<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Run" />
					<input type="button" onclick="window.returnValue=false;window.close();" value="Close" />
				</div>
			</ItemTemplate>
		</cfe:FreeFormView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Footer">
</asp:Content>
