[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>[%foreach(Column column in Source){%]
		<td>[%Write(column);%]</td>[%}%]
	<tr>
</table>