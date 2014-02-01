[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<div id="[%=GetId(Source)%]Date" data-win-control="WinJS.UI.DatePicker" tag="[%=GetId(Source)%]" data-win-bind="winControl.current: [%=Source.Name%]"></div>
<div id="[%=GetId(Source)%]Time" data-win-control="WinJS.UI.TimePicker" tag="[%=GetId(Source)%]" data-win-bind="winControl.current: [%=Source.Name%]"></div>