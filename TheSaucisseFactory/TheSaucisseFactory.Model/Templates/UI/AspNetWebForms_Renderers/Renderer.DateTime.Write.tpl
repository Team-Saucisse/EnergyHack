[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<cfe:Calendar runat="server" ID="[%=GetId(Source)%]" SelectedValue='<%#Bind("[%=BindName(Source)%]")%>' />