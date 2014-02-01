[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<table width="100%">
	[%int count = 0; foreach(Field field in Source){
		if (!IsVisible(field, WriterOptions.Mode)) continue;
		if (IsBlobType(field.TypedObject) && WriterOptions.Mode != FormMode.Edit) continue;
		count++;%]<tr>[%Write(field);%]</tr>
	[%}
	if (count == 0){%]<tr><td>There is no data than can be edited for this instance.</td></tr>[%}%]</table>