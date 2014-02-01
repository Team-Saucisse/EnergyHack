[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:HiddenField runat="server" Value='<%#Bind("EntityKey")%>' ID="[%=GetId(Source.ClrFullTypeName + ":EntityKey")%]" />
[%if (Source.ConcurrencyMode == ConcurrencyMode.Optimistic){%]<asp:HiddenField runat="server" Value='<%#Bind("RowVersion")%>' ID="[%=GetId(Source.ClrFullTypeName + ":RowVersion")%]" />[%}%]