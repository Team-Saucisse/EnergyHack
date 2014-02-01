[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[%@ namespace name="System" %]
[%@ namespace name="CodeFluent.Model" %]
[%@ namespace name="CodeFluent.Runtime" %]
[%@ namespace name="CodeFluent.Runtime.Utilities" %]
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="[%=Producer.WebAssemblyNamespace%]._Default" %>
<asp:Content runat="server" ContentPlaceHolderID="CultureComboPlaceHolder">
<li><div class="div_upperdock_sep"></div><cfe:CultureDropDownList CultureCookieName="culture" AutoPostBack="true" style="margin:2px 0px 0px 0px" id="cultures" runat="server" TitleMemberName="NativeName" TextMemberName="Name" /></li>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<link rel="stylesheet" href="<%=ResolveUrl("~/Styles/home.css")%>"  />
<script>
    $(function() {
        $('.namespace').columnize();
    });
</script>
	<div class="ui-widget" id="home"> 
	<h1>[%=Producer.Project.DefaultNamespace%] Project</h1> 
	<img src="images/components.png" alt="Application built with CodeFluent Entities" width="128" height="128" id="component" /> 
	<p id="intro"><%=string.Format((string)GetGlobalResourceObject("WebResources", "CFEGenerated"), DateTime.Parse("[%=System.DateTime.Now.ToString("o")%]", null, System.Globalization.DateTimeStyles.RoundtripKind))%></p><!--CFBuild: [%=CodeFluentContext.CodeFluentVersion%]-->
	<div> 
		[%foreach(VisibleNamespace vns in Producer.VisibleNamespaces){%]
		<div> 
			<div class="namespace"> 
				<h2>[%=vns.DisplayName%]</h2> 
				<p><asp:literal runat="server" Text="<%$ Resources:WebResources, NamespaceEntities %>" />:</p> 
				[%foreach(Entity entity in vns.Entities){%]
				<h4><a href="Pages/[%=RelativeUrl(entity)%].aspx">[%=Decamelize(entity.Name)%]</a></h4> 
				[%}%]
			</div> 
		</div> 
		[%}%]
	</div>
	</div>
</asp:Content>