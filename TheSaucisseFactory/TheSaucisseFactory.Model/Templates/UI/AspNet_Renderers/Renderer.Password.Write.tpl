[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:TextBox runat="server" ID="[%=GetId(Source)%]" Text='<%#Bind("[%=Source.Name%]")%>' TextMode="password" />