[%@ template inherits="CodeFluent.Producers.UI.BaseTemplate" %]
(function () {
    "use strict";

    var namespaceDescription = "A defined scope in your application.";
    var entityDescription = "A business concept.";
    var entityContent = "<p>This page allows an end user to create a new instance or browse the database for already saved instances:</p>"
		+ "<ul><li><b>Create a new instance</b>: Using the first hyperlink visible to the left side of this page, you can create a new instance of the Address entity.</li>"
		+ "<li><b>Load existing instances</b>: Using one of the hyperlinks to the left side of this page, you can load instances of the Address entity. Some methods have parameters, other are parameterless.</li>"
		+ "<li><b>Delete existing <i>Address</i> instances</b>: Once an instance has been loaded from the database using one of the methods on the left side of this page, the end user will be able to delete it, if it is authorized.</li>"
		+ "<li><b>Call custom methods on the <i>Address</i> type</b>: Any type of method can be defined on an entity, not only load, save or delete methods.</li></ul>"
		+ "<p>Here are some of the concepts used to build this entity:</p>"
		+ "<ul><li><b>Properties</b>: Each entity is defined by a set of properties. By default, properties are persistent but you can declare computed properties whose values are dynamically computed using custom code.</li>"
		+ "<li><b>Relations</b>: Relations are defined as properties. Several relationship types between entities are possible, such as inheritance, association and composition, one-to-many, one-to-one, many-to-one and many-to-many.</li>"
		+ "<li><b>Instances</b>: Instances can be defined for each entity in the model. An instance is a collection of values, each value corresponding to a property. This feature is very useful when developers want to initialize specific tables with data.</li>"
		+ "<li><b>Methods</b>: CodeFluent Entities - through this method concept - allows to go way further than CRUD methods. It allows architects and developers to define methods that will be available in all generated layers. Defining them in the model results in adding platform independent methods to the meta-model, which then will be interpreted by each producer to produce platform specific and optimized code. Note: the entity layout image on the left only presents user-defined methods. Methods automatically inferred at production time are not represented.</li>"
		+ "<li><b>Rules</b>: The rule concept in CodeFluent Entities embraces a broad set of automatic behavior implementations. There are lifecycle rules, transaction rules, validation rules, custom (written by the developer), and rules implemented in external engines. Rules can apply on various concepts such as entities, properties, methods, or the whole project.</li>"
		+ "<li><b>Views</b>: The view concept in CodeFluent Entities englobe two distinct concepts: a global modeling concept, and a persistence oriented concept. From a view, persistence layer producers will produce an SQL view, whereas graphic user interface producers will define for example the list of columns when displaying instances of an entity in a grid control.</li></ul>";

    // These three strings encode placeholder images. You will want to set the
    // backgroundImage property in your real data to be URLs to images.
    var lightGray = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXY7h4+cp/AAhpA3h+ANDKAAAAAElFTkSuQmCC";
    var mediumGray = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXY5g8dcZ/AAY/AsAlWFQ+AAAAAElFTkSuQmCC";
    var darkGray = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAANSURBVBhXY3B0cPoPAANMAcOba1BlAAAAAElFTkSuQmCC";

    // Each namespace must have a unique key to be displayed separately.
    var namespaces = [
		[% foreach (VisibleNamespace ns in Producer.VisibleNamespaces) { %]
		{ key: "[%=ns.Name%]", title: "[%=ns.DisplayName%]", subtitle: "Namespace ([%=ns.Entities.Count%] entities)", backgroundImage: "/images/namespace.png", bigImage: "/images/bignamespace.png", description: namespaceDescription },
		[% } %]        
    ];

    // Each entity is defined in a namespace.
    var entities = [
		[% for (int i = 0; i < Producer.VisibleNamespaces.Count; i++) { VisibleNamespace ns = Producer.VisibleNamespaces[i]; foreach (Entity entity in ns.Entities) { %]
		{ group: namespaces[[%=i%]], title: "[%=Decamelize(entity.Name)%]", subtitle: "Manage '[%=Decamelize(entity.Name)%]' data.", description: entityDescription, content: entityContent, icon: "/images/entity.png", backgroundImage: "/images/[%=entity.ClrFullTypeName%].png", clrFullTypeName: "[%=entity.ClrFullTypeName%]" },
        [% } } %]
    ];

    // Get a reference for an item, using the group key and item title as a
    // unique reference to the item that can be easily serialized.
    function getItemReference(item) {
        return [item.group.key, item.title];
    }

    function resolveGroupReference(key) {
        for (var i = 0; i < groupedItems.groups.length; i++) {
            if (groupedItems.groups.getAt(i).key === key) {
                return groupedItems.groups.getAt(i);
            }
        }
    }

    function resolveItemReference(reference) {
        for (var i = 0; i < groupedItems.length; i++) {
            var item = groupedItems.getAt(i);
            if (item.group.key === reference[0] && item.title === reference[1]) {
                return item;
            }
        }
    }

    // This function returns a WinJS.Binding.List containing only the items
    // that belong to the provided group.
    function getItemsFromGroup(group) {
        return list.createFiltered(function (item) { return item.group.key === group.key; });
    }

    var list = new WinJS.Binding.List();
    var groupedItems = list.createGrouped(
        function groupKeySelector(item) { return item.group.key; },
        function groupDataSelector(item) { return item.group; }
    );

    entities.forEach(function (item) {
        list.push(item);
    });

    WinJS.Namespace.define("Data", {
        serverUrl: "[%=Producer.ServerUrl%]",
        baseServicesUrl: "[%=Producer.BaseServicesUrl%]",
        items: groupedItems,
        groups: groupedItems.groups,
        getItemsFromGroup: getItemsFromGroup,
        getItemReference: getItemReference,
        resolveGroupReference: resolveGroupReference,
        resolveItemReference: resolveItemReference
    });
})();
