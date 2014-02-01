[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.DisplayFor(model => model.[%=Source.Name%], "[%=Renderer(Source)%]")
