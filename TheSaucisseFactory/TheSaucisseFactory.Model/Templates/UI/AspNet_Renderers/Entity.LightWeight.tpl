[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%PushTranslateBindName(Source.Name);%]<table width="100%" class="cf-lwe">
	[%foreach(Property property in Source.Properties){if (!property.UIEnabled) continue;%]<tr>[%Write(property);%]</tr>
	[%}%]</table>[%PopTranslateBindName();%]