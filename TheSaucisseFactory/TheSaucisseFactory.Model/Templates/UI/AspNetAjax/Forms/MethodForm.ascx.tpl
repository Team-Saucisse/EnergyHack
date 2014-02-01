[%@ template enumerable='Producer.VisibleMethodForms' enumerableItemName="form" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(form)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="[%=ClassName(form)%].ascx.cs" Inherits="[%=Producer.WebNamespace(form)%].[%=ClassName(form)%]" %>
<cfe:FreeFormView runat="server" ID="FreeFormView">
    <ItemTemplate>
		[%WriterOptions.Mode = FormMode.Insert;Write(form);%]
	</ItemTemplate>
</cfe:FreeFormView>

