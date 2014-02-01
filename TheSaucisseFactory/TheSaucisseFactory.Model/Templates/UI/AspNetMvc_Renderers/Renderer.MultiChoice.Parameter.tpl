[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.Editor("[%=Source.Name%]", "MultiChoice", new { EnumType = typeof([%=Source.ClrFullTypeName%])})