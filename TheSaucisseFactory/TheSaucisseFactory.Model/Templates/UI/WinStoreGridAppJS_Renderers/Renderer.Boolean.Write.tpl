[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<input id="[%=GetId(Source)%]" type="checkbox" data-win-bind="checked: [%=Source.Name%]" />