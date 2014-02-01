[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<div class="tabs">
	<ul>[%foreach(Tab tab in Source){%]
		<li><a href="#tabs-[%=(tab.ModelIndex + 1)%]">[%=tab.DisplayName%]</a></li>[%}%]
	</ul>[%foreach(Tab tab in Source){%]
	<div id="tabs-[%=(tab.ModelIndex + 1)%]">
		[%Write(tab);%]
	</div>[%}%]
</div>
