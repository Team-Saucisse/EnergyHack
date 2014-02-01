[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
	if (!Source.IsReadOnly) 
	{%]
@Html.EditorFor(model => model.[%=Source.Name%], "RichText")
@Html.ValidationMessageFor(model => model.[%=Source.Name%])[%
	}
	else
	{%]
@Html.DisplayFor(model => model.[%=Source.Name%], "RichText")[%
	}%]
