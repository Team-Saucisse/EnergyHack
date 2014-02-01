[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:TextBox runat="server" Columns="38" MaxLength="38" ID="[%=GetId(Source)%]" Text='<%#Bind("[%=Source.Name%]")%>' />