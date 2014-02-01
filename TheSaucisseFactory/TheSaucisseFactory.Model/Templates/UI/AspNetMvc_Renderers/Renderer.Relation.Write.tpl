[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
	Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
	if (entity == null) 
	{
		entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
	}
	if (entity.IsLightWeight) 
	{
		WriteLightWeight(Source, entity);
	} 
	else 
	{
		if (!Source.IsReadOnly) 
		{%]
	@Html.EditorFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=entity.ClrFullTypeName%]", Nullable = [%=Source.IsNullable.ToString().ToLowerInvariant()%], ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"})[%
		}
		else
		{%]
	@Html.DisplayFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=entity.ClrFullTypeName%]", Nullable = [%=Source.IsNullable.ToString().ToLowerInvariant()%], ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"})[%
		}
	}%]
