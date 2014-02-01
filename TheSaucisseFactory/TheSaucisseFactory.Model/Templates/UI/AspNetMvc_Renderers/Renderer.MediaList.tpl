[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
if (entity == null) entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
%]@Html.DisplayFor(model => model.[%=Source.Name%], "MediaList", new { EntityTypeName = "[%=entity.ClrFullTypeName%]", Nullable = [%=Source.IsNullable.ToString().ToLowerInvariant()%], ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"})
