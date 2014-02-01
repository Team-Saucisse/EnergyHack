[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:Label runat="server" ID="[%=GetId(Source)%]" Text='<%#Eval("[%=BindExpression(Source)%]", "[%=Format(Source)%]")%>' />