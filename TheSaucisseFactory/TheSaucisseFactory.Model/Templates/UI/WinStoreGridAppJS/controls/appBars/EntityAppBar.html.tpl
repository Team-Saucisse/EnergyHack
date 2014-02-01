[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), entity.ClrFullTypeName) + "AppBar" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>[%=entity.Name%]AppBar</title>

    <script>
        (function () {
            "use strict";

			var nav = WinJS.Navigation;
			
            var page = WinJS.UI.Pages.define("/controls/appBars/[%=entity.ClrFullTypeName%]AppBar.html", {
                ready: function (element, options) {
                [%foreach(VisibleMethod method in GetVisibleMethods(entity)) { %]
					document.getElementById('cmd[%=method.Name%]').addEventListener("click", on[%=method.Name%]Click, false);[%}%]
                }
            });
			[%foreach(VisibleMethod method in GetVisibleMethods(entity)) { %]
				function on[%=method.Name%]Click() {
					nav.navigate("/pages/[%=RelativeUrl(entity)%]/[%=entity.Name%][%=method.Name%].html");
				}
			[%}%]
        })();
    </script>
</head>

<body>  
    <style>
		/* define style here if needed */
    </style>  

    <div id="entityAppBar" data-win-control="WinJS.UI.AppBar" data-win-options="">    
        [%foreach(VisibleMethod method in GetVisibleMethods(entity)) { %]
		<button data-win-control="WinJS.UI.AppBarCommand" 
			data-win-options="{id:'cmd[%=method.Name%]', label:'[%=method.DisplayName%]', icon:'list', section:'global'}">
        </button>
        [%}%]
    </div>
</body>
</html>