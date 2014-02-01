[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
@Html.HiddenFor(model => model.EntityKey)
[%if (Source.ConcurrencyMode == ConcurrencyMode.Optimistic){%]@Html.HiddenFor(model => model.RowVersion)[%}%]