[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
<%@ Page Title="[%=DisplayName(entity)%] Management" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="[%=entity.Name%].aspx.cs" Inherits="[%=Producer.WebNamespace(entity)%].[%=entity.Name%]" %>
<asp:Content runat="server" ContentPlaceHolderID="Header">
		<div class="headerhide"><p>&nbsp;</p></div>
		<div class="box">
			<div class="cfe"><img alt="Home" class="cfeimg" src="~/Images/cfmetrowhite32.png" runat="server"/><a href="~/default.aspx" runat="server" style="color:white"><img alt="Home" runat="server" class="lefticon" src="~/Images/next16.png" /><asp:literal runat="server" Text="<%$ Resources:WebResources, Home %>" /></a></div>
			<ul class="methods">
			<li><b><a href="#" onclick="javascript:return cfeDialog('<%=ResolveUrl("~/Pages/")%>[%=RelativeUrl(entity)%]Form.aspx?mode=Insert');"><img runat="server" alt="Add" class="lefticon" src="~/Images/add16.png" /><asp:literal runat="server" Text="<%$ Resources:WebResources, AddNew %>" /></a></b></li>
			[%foreach(VisibleMethod method in GetVisibleMethods(entity)) { if (method.NeedsForm) {%]
			<li><a href="#" onclick="javascript:return cfeDialog('<%=ResolveUrl("~/Pages/")%>[%=RelativeUrl(method.DefaultForm)%].aspx', '<%=ResolveUrl("~/Pages/")%>[%=RelativeUrl(entity)%]List.aspx?Method=[%=method.Name%]');">[%=DisplayName(method)%]</a></li>
			[%}else{%]
			<li><a href="~/Pages/[%=RelativeUrl(entity)%]List.aspx?Method=[%=method.GetPagedName(Producer.ModelProducer)%]" runat="server">[%=DisplayName(method)%]</a></li>
			[%}}%]
			</ul></div>
		<div class="header">[%=DisplayName(entity.Name)%]<asp:literal runat="server" Text="<%$ Resources:WebResources, ManagementPage %>" /></div></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="content">
    <%=string.Format((string)GetGlobalResourceObject("WebResources", "EntityPresentation"), "[%=entity.Name%]") %>
    <%=string.Format((string)GetGlobalResourceObject("WebResources", "EntityPresentation2"), "[%=entity.ClrFullTypeName%]", ResolveUrl("~/Images/[%=entity.ClrFullTypeName%].png")) %>
    </div>
</asp:Content>
