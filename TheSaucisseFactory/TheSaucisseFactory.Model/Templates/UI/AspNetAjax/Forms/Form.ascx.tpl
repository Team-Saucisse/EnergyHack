[%@ template enumerable='Producer.VisibleEntityForms' enumerableItemName="form" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(form)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="[%=ClassName(form)%].ascx.cs" Inherits="[%=Producer.WebNamespace(form)%].[%=ClassName(form)%]" %>
<cfe:EntityDataSource runat="server" ID="EntityDataSource" TypeName="[%=form.ParentEntity.ClrFullTypeName%]" />
<cfe:EntityFormView runat="server" ID="EntityFormView" DefaultMode="Insert" Width="100%" DataSourceID="EntityDataSource" AutoChangeMode="true" DataKeyNames="[%=KeyNames(form.ParentEntity)%]">
    <InsertItemTemplate>
		[%WriterOptions.Mode = FormMode.Insert;Write(form);%]
	</InsertItemTemplate>
    <EditItemTemplate>
		[%WriterOptions.Mode = FormMode.Edit;Write(form);%]
		[%WriteEntityKeyField(form.ParentEntity);%]
	</EditItemTemplate>
    <ItemTemplate>
		[%WriterOptions.Mode = FormMode.ReadOnly;Write(form);%]
	</ItemTemplate>
</cfe:EntityFormView>