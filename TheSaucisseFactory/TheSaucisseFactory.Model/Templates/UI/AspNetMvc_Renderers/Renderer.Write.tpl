[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
	if (!Source.IsReadOnly) 
	{%]
	@Html.EditorFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]")
	@Html.ValidationMessageFor(model => model.[%=Source.Name%])[%
	} 
	else
	{
		CodeFluent.Model.Property l_property = Source as CodeFluent.Model.Property;
		if (l_property != null && l_property.TypeName == "DateTime")
		{%]
		@if (Model.[%=Source.Name%] != DateTime.MinValue)
		{[%
		}%]
	@Html.DisplayFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]")[%
		if (l_property != null && l_property.TypeName == "DateTime")
		{%]
		}[%
		}
	}%]
