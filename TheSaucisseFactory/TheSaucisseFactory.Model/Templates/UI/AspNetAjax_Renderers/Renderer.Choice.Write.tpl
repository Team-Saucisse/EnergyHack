[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:DropDownList runat="server" ID="[%=GetId(Source)%]">[%foreach(VisibleEnumerationValue value in Producer.GetEnumerationValues(Source.ClrFullTypeName)){%]
	<asp:ListItem Text="[%=value.Name%]" Value="[%=value.TypedValue%]" />[%}%]
</asp:DropDownList>