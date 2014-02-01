[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.EditorFor(model => model.[%=Source.Name%], "Password", new { Mode = "[%=WriterOptions.Mode%]"})
