[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<textarea id="[%=GetId(Source)%]" data-win-bind="textContent: [%=Source.Name%]"></textarea>