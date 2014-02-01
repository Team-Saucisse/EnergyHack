[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<select id="[%=GetId(Source)%]">[%foreach(VisibleEnumerationValue value in Producer.GetEnumerationValues(Source.ClrFullTypeName)){%]
	<option value="[%=value.TypedValue%]">[%=Decamelize(value.Name)%]</option>[%}%]
</select>
