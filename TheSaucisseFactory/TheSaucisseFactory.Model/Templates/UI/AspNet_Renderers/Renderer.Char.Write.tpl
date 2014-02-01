[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:TextBox runat="server" Columns="1" MaxLength="1" ID="[%=GetId(Source)%]" Text='<%#Bind("[%=Source.Name%]")%>' />