[%@ template enumerable='Producer.VisibleEntityMethods' enumerableItemName="method" enumerableTargetPathFunc='Path.Combine(Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(method.Entity)), method.Entity.Name + method.Name) + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[% Entity entity = method.Entity; System.Collections.Generic.IList<VisibleField> insertFields = GetVisibleFields(entity.DefaultForm, FormMode.Insert); System.Collections.Generic.IList<VisibleField> editFields = GetVisibleFields(entity.DefaultForm, FormMode.Edit); System.Collections.Generic.IList<VisibleField> readFields = GetVisibleFields(entity.DefaultForm, FormMode.ReadOnly); System.Collections.Generic.IList<VisibleField> methodFields = GetVisibleFields(method.DefaultForm, FormMode.Insert); %]
(function () {
    "use strict";

    var binding = WinJS.Binding;
    var ui = WinJS.UI;
    	
    var page = WinJS.UI.Pages.define("/pages/[%=RelativeUrl(entity)%]/[%=entity.Name%][%=method.Name%].html", {
        ready: function (element, options) {
            var listView = document.getElementById("dataListView").winControl;
            listView.removeEventListener("selectionchanged", onSelectionChanged);
            listView.addEventListener("selectionchanged", onSelectionChanged, false);
            listView.element.focus();
            [% if (method.Parameters.Count == 0) {%]loadData();[% } else { %]document.getElementById("loadButton").addEventListener("click", loadData, false);
            
            // Event handlers for relations in method form[% } %]
            [% WriterOptions.Mode = FormMode.Insert; foreach (VisibleField f in methodFields) { if (!f.IsRelation || f.RelatedEntity == null || f.RelatedEntity.IsLightWeight) continue; %]
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Button").addEventListener("click", onSelectButtonClick, false);
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Flyout").addEventListener("afterhide", onFlyoutDismiss, false);[%}%]
            
            // Command bar event handlers
            document.getElementById("cmdNew").addEventListener("click", onCreateNewClick, false);
            document.getElementById("cmdEdit").addEventListener("click", onEditClick, false);
            document.getElementById("cmdDelete").addEventListener("click", onDeleteClick, false);
            
            // Form buttons (create, edit, cancel) event handlers
            document.getElementById("cancelCreateButton").addEventListener("click", onCancelClick, false);
            document.getElementById("cancelEditButton").addEventListener("click", onCancelClick, false);
            document.getElementById("createButton").addEventListener("click", onDoCreate, false);
            document.getElementById("editButton").addEventListener("click", onDoEdit, false);
            
            // Relation event handlers[% WriterOptions.Mode = FormMode.Insert; foreach (VisibleField f in insertFields) { if (!f.IsRelation || f.RelatedEntity == null || f.RelatedEntity.IsLightWeight) continue; %]
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Button").addEventListener("click", onSelectButtonClick, false);
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Flyout").addEventListener("afterhide", onFlyoutDismiss, false);[% } WriterOptions.Mode = FormMode.Edit; foreach (VisibleField f in editFields) { if (!f.IsRelation || f.RelatedEntity == null || f.RelatedEntity.IsLightWeight) continue; %]
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Button").addEventListener("click", onSelectButtonClick, false);
            document.getElementById("[%=GetId(f.Field.TypedObject)%]Flyout").addEventListener("afterhide", onFlyoutDismiss, false);[%}%]
            
            // Blob event handlers[% WriterOptions.Mode = FormMode.Edit; foreach (VisibleField f in editFields) { if (!f.IsBinaryLargeObject) continue; %]
            document.getElementById("[%=GetId(f.Field.TypedObject)%]").addEventListener("click", onBlobPickClick, false);[%}%]
        }
    });

	

    function loadData() {
		clearReadForm();
		[% if (method.Parameters.Count > 0) { %]	
		var parameters = {
			[% WriterOptions.Mode = FormMode.Insert; foreach (VisibleField f in methodFields) { %] 
			[%=f.Name%]: document.getElementById("[%=GetId(f.Field.TypedObject)%]").value[%if (string.IsNullOrEmpty(f.DefaultValue)) {%],[%} else {%] ? document.getElementById("[%=GetId(f.Field.TypedObject)%]").value : [%=f.DefaultValue%],[% } } %]
		}[%}%]
		[% if (method.Parameters.Count > 0) { %]
        var dataSource = new codeFluentServiceDataSource("[%=entity.ClrFullTypeName%].svc", "[%=method.Name%]", parameters);[% } else { %]var dataSource = new codeFluentServiceDataSource("[%=entity.ClrFullTypeName%].svc", "[%=method.Name%]");[%}%]
        var listView = document.getElementById("dataListView").winControl;
        listView.itemDataSource = dataSource;

        var selectionCount = listView.selection.count();
        if (selectionCount == 0)
            listView.selection.set(0);
    }

    function onSelectionChanged(args) {
		var listView = document.getElementById("dataListView").winControl;
        var selectionCount = listView.selection.count();
        if (selectionCount <= 0)
            return;

        var that = this;
        // Selection is restriced to a single item.
        listView.selection.getItems().done(function updateDetails(items) {
		    if (items.length > 0) {
                that.itemSelectionIndex = items[0].index;
				bindForms(items[0].data);
            }
        });
    }

	function onCancelClick(args) {
        var element = document.getElementById("createFormDiv");
        element.classList.add("hide");

        element = document.getElementById("editFormDiv");
        element.classList.add("hide");
        
        var element = document.getElementById("readFormDiv");
        element.classList.remove("hide");
	}    

	function onBlobPickClick(args) {
	    var listView = document.getElementById("dataListView").winControl;
	    if (listView.selection.count() == 0)
	        return;

	    listView.selection.getItems().done(function updateDetails(items) {
	        var data = items[0].data;
	        var button = args.srcElement;
	        var openPicker = new Windows.Storage.Pickers.FileOpenPicker();
	        openPicker.viewMode = Windows.Storage.Pickers.PickerViewMode.thumbnail;
	        openPicker.suggestedStartLocation = Windows.Storage.Pickers.PickerLocationId.homeGroup;
	        openPicker.fileTypeFilter.replaceAll(["*"]);

	        openPicker.pickSingleFileAsync().then(function (file) {
	            if (file) {
	                // Application now has read/write access to the picked file
	                button.textContent = file.name;
	                data["_storagefile_" + button.name] = file;
	            } else {
	                // The picker was dismissed with no selected file, do nothing
	            }
	        });
	    });
	}


	/***** Create *****/
        
    function onCreateNewClick(args) {
        var element = document.getElementById("readFormDiv");
        element.classList.add("hide");

        element = document.getElementById("editFormDiv");
        element.classList.add("hide");

        element = document.getElementById("createFormDiv");
        element.classList.remove("hide");
    }

	function onDoCreate(args) {
		var listView = document.getElementById("dataListView").winControl;
		var dataSource = listView.itemDataSource;
		
		var data = {};
		[% WriterOptions.Mode = FormMode.Insert; foreach (VisibleField f in insertFields) { if (f.IsBinaryLargeObject) continue; if (f.UIType == CodeFluent.Runtime.UI.UIType.DateTime) {%]
		data.[%=f.Name%] = getDateTimeValue("[%=GetId(f.Field.TypedObject)%]", null);[% } else if (f.IsRelation && !f.RelatedEntity.IsLightWeight) {%]
        data["[%=f.Name%].EntityKey"] = getValue(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), null);[% } else { %]
        data.[%=f.Name%] = getValue(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), null);[%}}%]

        dataSource.insertAtEnd(undefined, data);
        onAfterEdit(data);
    }


	/***** Edit *****/

    function onEditClick(args) {
        var element = document.getElementById("readFormDiv");
        element.classList.add("hide");

        element = document.getElementById("createFormDiv");
        element.classList.add("hide");

        element = document.getElementById("editFormDiv");
        element.classList.remove("hide");
    }

	function onDoEdit(args) {
        var listView = document.getElementById("dataListView").winControl;
		listView.selection.getItems().done(function (items) {
		    if (items.length === 0)
				returns;
				
		    var data = items[0].data;[% WriterOptions.Mode = FormMode.Edit; bool hasBlobs = false; foreach (VisibleField f in editFields) { if (f.UIType == CodeFluent.Runtime.UI.UIType.DateTime) {%]
			data.[%=f.Name%] = getDateTimeValue("[%=GetId(f.Field.TypedObject)%]", null);[% } else if (f.IsBinaryLargeObject){ hasBlobs=true; } else if (f.IsRelation && !f.RelatedEntity.IsLightWeight) { %]
			data["[%=f.Name%].EntityKey"] = getValue(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), null);[%} else { %]
			data.[%=f.Name%] = getValue(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), null);[%}}%]
			if (data.EntityKey == undefined || data.EntityKey == null)
				return;
				
			var dataSource = listView.itemDataSource;
			// Update non-blob properties
			var propertyBag = filterBlobProperties(data);
			dataSource.update(propertyBag);
		
			[% if (hasBlobs) { %]// Update blob properties if any
			var prop, prefixLength = "_storagefile_".length;
			for (prop in data) {
				if (prop.indexOf("_storagefile_", 0) != 0)
					continue;

				var propertyName = prop.substr(prefixLength, prop.length - prefixLength);
				var file = data[prop];
				dataSource.uploadFile(propertyName, data.EntityKey, file);
			}[%}%]
			onAfterEdit(data);
		});
    }
    
    function filterBlobProperties(data) {
		var property, propertyBag = {};
		for (property in data) {
			// skip storage files if any
			if (property.indexOf("_storagefile_", 0) == 0)
                continue;
                
			propertyBag[property] = data[property];
		}
		
		// Remove blob properties[% WriterOptions.Mode = FormMode.Edit; foreach (VisibleField f in editFields) { if (!f.IsBinaryLargeObject) continue; %]
		delete propertyBag.[%=f.Name%];[%}%]
		return propertyBag;
    }

	/***** Create/Edit Relations *****/

	var dataSourceTable = {[% WriterOptions.Mode = FormMode.Edit; foreach (VisibleField f in editFields) { if (!f.IsRelation || f.RelatedEntity == null || f.RelatedEntity.IsLightWeight) continue; %]
        [%=f.Name%]: { dataSource: new codeFluentServiceDataSource("[%=f.RelatedEntity.ClrFullTypeName%].svc", "[%=f.ChoiceMethod.Name%]", null, "EntityKey|EntityDisplayName") },[%}%]
    };

	function onSelectButtonClick(args) {
        var button = args.srcElement;
        var ctlId = button.attributes["tag"].value;
        var dataSourceKey = button.name;
        var listView = document.getElementById(ctlId + "ListView").winControl;
		listView.itemDataSource = dataSourceTable[dataSourceKey].dataSource;
        var flyout = document.getElementById(ctlId + "Flyout").winControl;
        flyout.show(button);
    }

	function onFlyoutDismiss(args) {
		var flyout = args.srcElement;
		var ctlId = flyout.attributes["tag"].value;
		var input = document.getElementById(ctlId);
		var textbox = document.getElementById(ctlId + "Text");
		var listView = document.getElementById(ctlId + "ListView").winControl;
		
		listView.selection.getItems().done(function (items) {
			if (items.length == 0)
				return;
				
		    input.value = "";
		    textbox.value = "";
		    for (var i = 0; i < items.length; i++) {
		        if (input.value !== "") {
		            input.value += "[%=CodeFluent.Runtime.CodeFluentConfiguration.DefaultEntityKeyListSeparator%]"; // CodeFluentConfiguration.DefaultEntityKeyListSeparator
		            textbox.value += ", ";
		        }
		        input.value += items[i].key;
                textbox.value += items[i].data.EntityDisplayName;
            }
        });
	}
		

	/***** Delete *****/	

    function onDeleteClick(args) {
        var msg = new Windows.UI.Popups.MessageDialog("Are you sure you?", "Delete");
        msg.commands.append(new Windows.UI.Popups.UICommand("Delete", onDoDelete));
        msg.commands.append(new Windows.UI.Popups.UICommand("Cancel"));
        msg.defaultCommandIndex = 0;
        msg.cancelCommandIndex = 1;
        msg.showAsync();
    }

    function onDoDelete(command) {
        var listView = document.getElementById("dataListView").winControl;
        listView.selection.getItems().done(function (items) {
            if (items.length > 0) {
                var dataSource = listView.itemDataSource;

                var params = {
                    EntityKey: items[0].key,[% if (entity.ConcurrencyMode == ConcurrencyMode.Optimistic) { %]
                    RowVersion: items[0].data.RowVersion[%}%]
                }
                dataSource.remove(params);
                listView.selection.set(0);
            }
        });
    }
    
    
    /***** Helpers *****/
    
    function clearReadForm() {
        var readForm = document.getElementById("readForm");
        var emptyData = {[%WriterOptions.Mode = FormMode.ReadOnly; foreach (VisibleField f in readFields) {%]
			[%=f.Name%]: "",[%}%]
        };
        binding.processAll(readForm, emptyData);
    }
    
    function bindForms(data) {
		var readForm = document.getElementById("readForm");
        binding.processAll(readForm, data);
        [% WriterOptions.Mode = FormMode.ReadOnly; foreach (VisibleField f in readFields) { if (!f.IsChoice)continue; %] 
		preselectEnumValues(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), data.[%=f.Name%]);[%}%]
		
        var editForm = document.getElementById("editFormDiv");
        binding.processAll(editForm, data);
        [% WriterOptions.Mode = FormMode.Edit; foreach (VisibleField f in editFields) { if (!f.IsChoice)continue; %] 
		preselectEnumValues(document.getElementById("[%=GetId(f.Field.TypedObject)%]"), data.[%=f.Name%]);[%}%]
    }
        
    function preselectEnumValues(element, enumValue) {
        for (var i = 0; i < element.children.length; i++) {
            var option = element.children[i];
            if ((enumValue == 0 && i == 0) || (option.value & enumValue)) {
                option.setAttribute("selected", "selected");
            } else {
                option.removeAttribute("selected");
            }
        }
    }
      
    function onAfterEdit(data) {
        // hide other forms
        var element = document.getElementById("createFormDiv");
        element.classList.add("hide");

        element = document.getElementById("editFormDiv");
        element.classList.add("hide");

        // show & update read-only form
        element = document.getElementById("readFormDiv");
        element.classList.remove("hide");
        bindForms(data);
    }
    
    function getDateTimeValue(elementId, defaultValue) {
        var date = document.getElementById(elementId + "Date").winControl.current;
        var time = document.getElementById(elementId + "Time").winControl.current;
        time.setFullYear(date.getFullYear());
        time.setMonth(date.getMonth());
        time.setDate(date.getDate());
        return time;
    }
    
    function getValue(element, defaultValue) {
        if (element == undefined || element == null) {
            return defaultValue;
        }

        if (element.nodeName == "SELECT") {
            var result = 0;
            for (var i = 0; i < element.children.length; i++) {
                if (element.children[i].selected) {
                    result |= element.children[i].value;
                }
            }
            return result;
        }

        if (element.nodeName == "TEXTAREA") {
            return element.innerText;
        }

        if (element.checked) {
            return element.checked;
        }

        if (element.files) {
            return element.files;
        }

        if (element.nodeName == "DIV") {
            var attribute = element.attributes["data-win-control"];
            if (attribute && attribute.value == "WinJS.UI.DatePicker") {
                var datePicker = element.winControl;
                return datePicker.current;
            }
        }
        
        if (element.value) {
            return element.value;
        }
        
        return defaultValue;
    }
})();
