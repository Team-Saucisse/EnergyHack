[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<input id="[%=GetId(Source)%]" type="password" data-win-bind="textContent: [%=Source.Name%]" />