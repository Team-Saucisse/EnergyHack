[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "List" + Template.FileExtension' inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
<%@ Page Title="[%=DisplayName(entity)%] List" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="[%=entity.Name%]List.aspx.cs" Inherits="[%=Producer.WebNamespace(entity)%].[%=entity.Name%]List" %>
<asp:Content runat="server" ContentPlaceHolderID="Header">
		<div class="box">
			<div class="cfe"><img alt="Home" class="cfeimg" src="~/Images/cfmetrowhite32.png" runat="server"/><a href="~/Pages/[%=RelativeUrl(entity)%].aspx" runat="server" style="color:white"><img alt="Home" runat="server" class="lefticon" src="~/Images/next16.png" />[%=DisplayName(entity)%]</a></div>
			<ul class="methods">
			<li><b><a href="#" onclick="javascript:return cfeDialog('<%=ResolveUrl("~/Pages/")%>[%=RelativeUrl(entity)%]Form.aspx?mode=Insert');"><img alt="Add" runat="server" class="lefticon" src="~/Images/add16.png" /><asp:literal runat="server" Text="<%$ Resources:WebResources, AddNew %>" /></a></b></li>
			[%foreach(VisibleMethod method in GetVisibleMethods(entity)) { if (method.NeedsForm) {%]
			<li><a href="#" onclick="javascript:return cfeDialog('<%=ResolveUrl("~/Pages/")%>[%=RelativeUrl(method.DefaultForm)%].aspx', '?Method=[%=method.Name%]');">[%=DisplayName(method)%]</a></li>
			[%}else{%]
			<li><a href="~/Pages/[%=RelativeUrl(entity)%]List.aspx?Method=[%=method.GetPagedName(Producer.ModelProducer)%]" runat="server">[%=DisplayName(method)%]</a></li>
			[%}}%]
			</ul>
			[%if(Producer.GetVisibleViews(entity).Count > 1) {%]
			<br />
			<div class="cfe"><img alt="Home" runat="server" class="lefticon" src="~/Images/view16.png" /><asp:literal runat="server" Text="<%$ Resources:WebResources, Views %>" /></div>
			<ul class="views">
			[%foreach(VisibleView view in Producer.GetVisibleViews(entity)) {%]
			<li><a href='[%=entity.Name%]List.aspx?Method=<%=Request["Method"]%>&view=[%=view.Name%]'>[%=view.DisplayName%]</a></li>
			[%}%]
			</ul>
			[%}%]
			</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <cfe:EntityDataSource runat="server" TypeName="[%=entity.ClrFullTypeName%]" ID="DataSource" Method="~Method" OnError="OnError" PageSize="[%=(Producer.PageSize + 1)%]" AutoParametersModes="Form, QueryString" AutoParametersPrefix="_p_" />
    
    [%foreach(VisibleView view in Producer.GetVisibleViews(entity)) {%]
    <div class='contentgrid'><div class='widthgrid'>
    <asp:GridView runat="server" ID="[%=view.Name%]Grid" CssClass="grid" AllowPaging="true" CellPadding="5" CellSpacing="0" AllowSorting="true"
        EmptyDataText="No data" AutoGenerateColumns="false" DataKeyNames="[%=KeyNames(entity)%]" GridLines="None" PagerStyle-CssClass="gridpager" PageSize="[%=Producer.PageSize%]">
        <Columns>
            <cfe:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" ButtonType="Button" EditUrl="[%=entity.Name%]Form.aspx?mode=Update&_p_key={0}" OnClickFormat="javascript:return cfeDialog('{0}');" />
            [%foreach(ViewProperty property in view.View.Properties) {%]
            [%Write(property, null, RendererTemplateSearchModes.NeedCategoryMatch | RendererTemplateSearchModes.NeedRendererTypeMatch, RendererType.Column);%]
            [%}%]
        </Columns>
        </asp:GridView>
    </div></div>
    [%}%]
</asp:Content>
