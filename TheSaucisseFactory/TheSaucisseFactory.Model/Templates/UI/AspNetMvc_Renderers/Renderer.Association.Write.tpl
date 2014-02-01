[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
	if (!Source.IsReadOnly) 
	{%]
@Html.EditorFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=Source.Project.Sets[Source.ClrFullTypeName].ItemEntity.ClrFullTypeName%]", ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"})[%
	}
	else
	{%]
@Html.DisplayFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]", new { EntityTypeName = "[%=Source.Project.Sets[Source.ClrFullTypeName].ItemEntity.ClrFullTypeName%]", ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"})[%
	}%]
