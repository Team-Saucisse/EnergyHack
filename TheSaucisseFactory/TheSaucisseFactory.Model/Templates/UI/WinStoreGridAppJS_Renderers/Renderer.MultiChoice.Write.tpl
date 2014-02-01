[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<select id="[%=GetId(Source)%]" multiple>[%foreach(VisibleEnumerationValue value in Producer.GetEnumerationValues(Source.ClrFullTypeName)){%]
	<option value="[%=value.TypedValue%]">[%=value.Name%]</option>[%}%]
</select>
