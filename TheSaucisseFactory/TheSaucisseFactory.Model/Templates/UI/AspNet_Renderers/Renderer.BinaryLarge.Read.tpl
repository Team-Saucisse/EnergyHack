[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<cfe:BlobControl runat="server" ID="[%=GetId(Source)%]" UrlProperties='<%#Eval("[%=Source.Name%]", "{0:UrlProperties}")%>' />