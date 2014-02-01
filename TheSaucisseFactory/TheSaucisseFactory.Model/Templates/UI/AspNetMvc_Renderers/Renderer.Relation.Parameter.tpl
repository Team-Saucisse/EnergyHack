[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
if (entity == null) entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
if (entity.IsLightWeight) {WriteLightWeight(Source, entity);} else {%]@Html.DropDownList("[%=Source.Name%]", new SelectList(CodeFluent.Runtime.Web.UI.WebControls.EntityDataSource.GetEnumerable("[%=entity.ClrFullTypeName%]", "[%=ChoiceMethodName(Source)%]"), "EntityKey", "EntityDisplayName"))[%}%]
