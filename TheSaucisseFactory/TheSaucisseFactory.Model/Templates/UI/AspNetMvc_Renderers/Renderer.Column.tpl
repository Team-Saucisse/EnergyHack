[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[% 
	
	CodeFluent.Model.ViewProperty l_viewProperty = Source as CodeFluent.Model.ViewProperty;
	
	if (l_viewProperty != null)
	{
		Entity l_entity = Source.Project.Entities[Source.ClrFullTypeName];
		if (l_entity == null) 
		{
			l_entity = l_viewProperty.ProjectEntity; // Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
		}

		if (l_viewProperty.TypeName == "System.DateTime")
		{%]
	@if (item.[%=Source.Name%] != DateTime.MinValue)
	{
	[%	}%]

		@Html.DisplayFor(modelItem => item.[%=Source.Name%], "[%=Renderer(Source)%]"[% 
		
		if (l_entity != null)
		{%], new { EntityTypeName = "[%=l_entity.ClrFullTypeName%]", Nullable = [%=Source.IsNullable.ToString().ToLowerInvariant()%], ChoiceMethodName = "[%=ChoiceMethodName(Source)%]"} [%
		}%])
		[%
		if (l_viewProperty.TypeName == "System.DateTime")
		{%]
	}
	[%	}
	}
	else 
	{%]
	@Html.DisplayFor(modelItem => item.[%=Source.Name%], "[%=Renderer(Source)%]")[%
	}%]
