(function () {
    "use strict";

    var ui = WinJS.UI;
    var utils = WinJS.Utilities;

    ui.Pages.define("/pages/itemDetail/itemDetail.html", {
        // This function is called whenever a user navigates to this page. It
        // populates the page elements with the app's data.
        ready: function (element, options) {
            var entity = options && options.item ? Data.resolveItemReference(options.item) : Data.items.getAt(0);
            element.querySelector(".titlearea .pagetitle").textContent = entity.group.title;
            element.querySelector("article .item-title").textContent = entity.title;
            element.querySelector("article .item-subtitle").textContent = entity.subtitle;
            element.querySelector("article .item-image").src = entity.backgroundImage;
            element.querySelector("article .item-image").alt = entity.subtitle;
            element.querySelector("article .item-content").innerHTML = entity.content;
            element.querySelector(".content").focus();

            var renderHost = element.querySelector(".entityAppBar-renderedControl");
            WinJS.UI.Pages.render("/controls/appBars/" + entity.clrFullTypeName + "AppBar.html", renderHost).done();
        },
        unload: function () {
            var otherAppBars = document.querySelectorAll('div[data-win-control="WinJS.UI.AppBar"]');
            for (var i = 0; i < otherAppBars.length; i++) {
                var otherScenarioAppBar = otherAppBars[i];
                otherScenarioAppBar.parentNode.removeChild(otherScenarioAppBar);
            }
        }
    });
})();
