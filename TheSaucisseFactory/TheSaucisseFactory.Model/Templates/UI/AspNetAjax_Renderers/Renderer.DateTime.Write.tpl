[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:TextBox runat="server" ID="[%=GetId(Source)%]" Text='<%#Bind("[%=BindName(Source)%]")%>' Class="dtpicker" />