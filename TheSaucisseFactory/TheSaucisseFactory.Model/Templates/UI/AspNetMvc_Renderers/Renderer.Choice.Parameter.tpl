[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.Editor("[%=Source.Name%]", "Choice", new { EnumType = typeof([%=Source.ClrFullTypeName%])})