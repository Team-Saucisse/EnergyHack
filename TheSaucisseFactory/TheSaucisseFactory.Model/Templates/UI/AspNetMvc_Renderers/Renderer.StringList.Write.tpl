[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.EditorFor(model => model.[%=Source.Name%], "StringList", new { PropertyName = "[%=Source.Name%]" })
@Html.ValidationMessageFor(model => model.[%=Source.Name%])
