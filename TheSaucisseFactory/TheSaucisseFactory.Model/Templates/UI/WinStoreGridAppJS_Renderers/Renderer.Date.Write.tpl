[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<div id="[%=GetId(Source)%]" data-win-control="WinJS.UI.DatePicker" data-win-bind="winControl.current: [%=Source.Name%]"></div>
