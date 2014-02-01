[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
	Entity l_entity = Source.Project.Entities[Source.ClrFullTypeName];
	if (l_entity == null) 
	{
		l_entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
	}

	if (!Source.IsReadOnly) 
	{%]
@Html.EditorFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=
	l_entity.ClrFullTypeName%]", ChoiceMethodName = "[%=
	ChoiceMethodName(Source)%]", RelatedEntityId = Model.EntityKey})[%
	}
	else
	{%]
@Html.DisplayFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=
	l_entity.ClrFullTypeName%]", ChoiceMethodName = "[%=
	ChoiceMethodName(Source)%]"})[%
	}%]
