[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[% Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
if (entity == null) entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
if (entity.IsLightWeight) {WriteLightWeight(Source, entity);} else {%]<div class="association"><cfe:EntityCheckBoxList runat="server" ID="[%=GetId(Source)%]" EntityTypeName="[%=entity.ClrFullTypeName%]" NewSelectedValue='<%#Bind("[%=BindName(Source)%]")%>' SelectedEntities='<%#Eval("[%=BindName(Source)%]")%>' ChoiceMethodName="[%=ChoiceMethodName(Source)%]" /></div>[%}%]