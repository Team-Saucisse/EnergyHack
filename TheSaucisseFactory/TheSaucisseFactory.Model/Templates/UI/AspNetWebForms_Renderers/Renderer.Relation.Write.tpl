[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[% Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
if (entity == null) entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
if (entity.IsLightWeight) {WriteLightWeight(Source, entity);} else {%]<cfe:EntityDropDownList runat="server" ID="[%=GetId(Source)%]" AutoPostBack="true" EntityTypeName="[%=entity.ClrFullTypeName%]" NewSelectedValue='<%#Bind("[%=BindName(Source)%]")%>' SelectedValue='<%#Eval("[%=BindName(Source)%]")%>' ChoiceMethodName="[%=ChoiceMethodName(Source)%]" />[%}%]