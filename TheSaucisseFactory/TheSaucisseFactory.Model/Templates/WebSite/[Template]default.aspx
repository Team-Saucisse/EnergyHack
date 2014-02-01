[%@ template language="CSharp"%]
<%@ Page Language="C#"%>
<%CodeFluent.Runtime.Web.Utilities.UrlHelper.CultureRedirect("[%=Culture.Name%]" [%=Producer.GetAvailableCulturesList(Culture)%]);%>
