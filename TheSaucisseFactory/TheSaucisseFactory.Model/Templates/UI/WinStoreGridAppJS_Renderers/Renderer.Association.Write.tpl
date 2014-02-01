[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[% string currentId = GetId(Source); %]
<input id="[%=currentId%]" type="text" class="hide"  />
<input id="[%=currentId%]Text" type="text" tag="[%=currentId%]" disabled /><button id="[%=currentId%]Button" tag="[%=currentId%]" name="[%=Source.Name%]">Select...</button>
<div id="[%=currentId%]Flyout" data-win-control="WinJS.UI.Flyout" tag="[%=currentId%]">
	<label for="[%=currentId%]ListView" tag="[%=currentId%]">[%=Decamelize(Source.Name)%]</label>
	<div id="[%=currentId%]ListView" class="relatedEntityList" tag="[%=currentId%]"
         data-win-control="WinJS.UI.ListView" 
         data-win-options="{ layout : {type: WinJS.UI.ListLayout}, selectionMode: 'multi', tapBehavior: 'toggleSelect', itemTemplate: select('#relatedDataItemTemplate') }">
    </div>
</div>