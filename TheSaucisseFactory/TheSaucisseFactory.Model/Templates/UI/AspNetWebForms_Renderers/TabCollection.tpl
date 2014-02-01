[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<div class="tabs">
	<ul>[%foreach(Tab tab in Source) {%]
		<li><a href="#" onclick="javascript:return cfeTabClick(this, '[%=GetId(Source)%]');" class="[%=(tab.ModelIndex == 1 ? "tablinka":"tablink")%]" id="tablink_[%=tab.ModelIndex%]_[%=GetId(Source)%]">[%=tab.DisplayName%]</a></li>
		[%}%]
	</ul>
</div>
[%foreach(Tab tab in Source) {%]
<div class="[%=(tab.ModelIndex == 1 ? "tabcontenta":"tabcontent")%]" id="tabcontent_[%=tab.ModelIndex%]_[%=GetId(Source)%]">
	[%Write(tab);%]
</div>
[%}%]
