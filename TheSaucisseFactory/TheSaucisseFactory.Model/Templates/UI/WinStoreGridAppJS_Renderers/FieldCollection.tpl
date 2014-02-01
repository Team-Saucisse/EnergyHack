[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<table class="fields">
	[%int count = 0; foreach(Field field in Source){if (!IsVisible(field, WriterOptions.Mode)) continue;count++;%]<tr>[%Write(field);%]</tr>
	[%}
	if (count == 0){%]<tr><td>There is no data than can be edited for this instance.</td></tr>[%}%]
</table>