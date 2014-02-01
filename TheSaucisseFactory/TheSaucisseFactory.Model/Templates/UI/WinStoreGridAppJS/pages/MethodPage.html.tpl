[%@ template enumerable='Producer.VisibleEntityMethods' enumerableItemName="method" enumerableTargetPathFunc='Path.Combine(Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(method.Entity)), method.Entity.Name + method.Name) + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[% Entity entity = method.Entity; %]
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>[%=entity.Name%] - [%=method.Name%]</title>

    <!-- WinJS references -->
    <link href="//Microsoft.WinJS.1.0/css/ui-dark.css" rel="stylesheet" />
    <script src="//Microsoft.WinJS.1.0/js/base.js"></script>
    <script src="//Microsoft.WinJS.1.0/js/ui.js"></script>

    <link href="/css/entityMethodPage.css" rel="stylesheet" />
    <script src="/js/CodeFluentServiceDataSource.js"></script>
    <script src="[%=entity.Name%][%=method.Name%].js"></script>
</head>

<body>
    <!-- template used to display data in list -->
    <div id="dataItemTemplate" class="itemtemplate" data-win-control="WinJS.Binding.Template">
        <img class="item-image" src="/images/data.png" />
        <div class="item-info">
            <h3 class="item-title win-type-ellipsis" data-win-bind="textContent: EntityDisplayName"></h3>
            <h6 class="item-subtitle win-type-ellipsis">Key: <span data-win-bind="textContent: EntityKey"></span></h6>
        </div>
    </div>
    
    <div id="relatedDataItemTemplate" class="itemtemplate" data-win-control="WinJS.Binding.Template">
       <h3 class="item-title" data-win-bind="textContent: EntityDisplayName"></h3>
       <h6 class="item-subtitle">Key: <span data-win-bind="textContent: EntityKey"></span></h6>
    </div>

    <!-- The content that will be loaded and displayed. -->
    <div class="entityMethodPage [%=entity.Name%][%=method.Name%] fragment">
        <header aria-label="Header content" role="banner">
            <button class="win-backbutton" aria-label="Back" disabled></button>
            <h1 class="titlearea win-type-ellipsis">
                <span class="pagetitle">[%=Decamelize(entity.Name)%]</span>
            </h1>
        </header>

		[% Form form = method.DefaultForm; if (form != null && method.Parameters.Count > 0) { %]<div class="loadsection">[% } else { %]<div class="hide">[%}%]
			<form id="loadForm" onsubmit="return false;">
				<fieldset class="formSection methodForm">
					<legend>[%=Decamelize(method.Name)%]</legend>
                    [%WriterOptions.Mode = FormMode.Insert; Write(form);%]
					<button id="loadButton" type="submit" class="button">Go!</button>
                </fieldset>
            </form>
        </div>

        <div class="itemlistsection" aria-label="List column">
            <div id="dataListView" class="itemlist" aria-label="List of [%=DisplayName(entity)%]" 
                data-win-control="WinJS.UI.ListView" 
                data-win-options="{ layout : {type: WinJS.UI.ListLayout}, selectionMode: 'single', tapBehavior: 'toggleSelect', itemTemplate: select('#dataItemTemplate') }"></div>
        </div>
        
        <div class="detailsection" aria-atomic="true" aria-label="[%=DisplayName(entity)%] detail column" aria-live="assertive">
			[% form = entity.DefaultForm; %]
			<div id="readFormDiv">
				<form id="readForm" onsubmit="return false;">
					<fieldset class="formSection entityForm">
						<legend>Details</legend>
						[%WriterOptions.Mode = FormMode.ReadOnly;Write(form);%]
					</fieldset>
				</form>
			</div>
			
			<div id="editFormDiv" class="hide">
				<form id="editForm" onsubmit="return false;">
					<fieldset class="formSection entityForm">
						<legend>Edit [%=Decamelize(entity.Name)%]</legend>
						[%WriterOptions.Mode = FormMode.Edit;Write(form);%]
						<button id="cancelEditButton" class="button">Cancel</button>
						<button id="editButton" type="submit" class="button">Save</button>
					</fieldset>
				</form>
			</div>
			
			<div id="createFormDiv" class="hide">
				<form id="createForm" onsubmit="return false;">
					<fieldset class="formSection entityForm">
						<legend>Create New [%=Decamelize(entity.Name)%]</legend>
						[%WriterOptions.Mode = FormMode.Insert;Write(form);%]
						<button id="cancelCreateButton" class="button">Cancel</button>
						<button id="createButton" type="submit" class="button">Create</button>
					</fieldset>
				</form>
			</div>
        </div>
    </div>
    
    <div id="appBar" data-win-control="WinJS.UI.AppBar" data-win-options="">
        <button data-win-control="WinJS.UI.AppBarCommand" 
			data-win-options="{id:'cmdNew', label:'Create New', icon:'add', section:'selection', tooltip:'Create a new [%=DisplayName(entity)%]'}">
        </button>
     
		<button data-win-control="WinJS.UI.AppBarCommand" 
			data-win-options="{id:'cmdEdit', label:'Edit', icon:'edit', section:'global', tooltip:'Edit selected [%=DisplayName(entity)%]'}">
        </button>
        
        <button data-win-control="WinJS.UI.AppBarCommand" 
			data-win-options="{id:'cmdDelete', label:'Delete', icon:'delete', section:'global', tooltip:'Delete selected [%=DisplayName(entity)%]'}">
        </button>
    </div>
</body>
</html>
