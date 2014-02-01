[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<asp:FileUpload runat="server" ID="[%=GetId(Source)%]Upload" PostedFile='<%#Bind("[%=Source.Name%]")%>'/>