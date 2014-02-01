// For an introduction to the Grid template, see the following documentation:
// http://go.microsoft.com/fwlink/?LinkID=232446
(function() {
    "use strict";

    var app = WinJS.Application;
    var activation = Windows.ApplicationModel.Activation;
    var nav = WinJS.Navigation;
    WinJS.strictProcessing();

    app.onerror = function errorHandler(e) {
        if (e === undefined)
            return;

        if (e.detail === undefined) {
            // Don't bother the user as we can't provide any details on the error
            return true; // Keep the app running though.
        }

        var error;
        if (e.detail.exception) {
            error = e.detail.exception;
        } else if (e.detail.error) {
            error = e.detail.error;
        } else {
            // Don't bother the user as we can't provide any details on the error
            return true; // Keep the app running though.
        }

        if (error.IsJsonExceptionObject && error.Exception) {
            return handleException(error.Exception);
        }

        var prop, text = "";
        for (prop in error) {
            text += prop + ": " + error[prop] + "\n";
        }
        var messageDialog = new Windows.UI.Popups.MessageDialog(text, "Oops, an unexpected error occurred");
        messageDialog.showAsync();
        return true; // We do not want the app to terminate.
    };

    function handleException(exception) {
        var title, message;
        if (exception.ClassName === "CodeFluent.Runtime.CodeFluentValidationException") {
            title = "Validation error";
            message = exception.Message;
        } else if (exception.ClassName === "CodeFluent.Runtime.CodeFluentConcurrencyException") {
            title = "Concurrency error";
            message = exception.Message;
        } else {
            title = exception.ClassName;
            message = exception.Message + "\n" + exception.StackTraceString;
        }

        var messageDialog = new Windows.UI.Popups.MessageDialog(message, title);
        messageDialog.showAsync();
        return true;
    }

    app.addEventListener("activated", function(args) {
        if (args.detail.kind === activation.ActivationKind.launch) {
            if (args.detail.previousExecutionState !== activation.ApplicationExecutionState.terminated) {
                // TODO: This application has been newly launched. Initialize
                // your application here.
            } else {
                // TODO: This application has been reactivated from suspension.
                // Restore application state here.
            }

            if (app.sessionState.history) {
                nav.history = app.sessionState.history;
            }
            args.setPromise(WinJS.UI.processAll().then(function() {
                if (nav.location) {
                    nav.history.current.initialPlaceholder = true;
                    return nav.navigate(nav.location, nav.state);
                } else {
                    return nav.navigate(Application.navigator.home);
                }
            }));
        }
    });

    app.oncheckpoint = function(args) {
        // TODO: This application is about to be suspended. Save any state
        // that needs to persist across suspensions here. If you need to 
        // complete an asynchronous operation before your application is 
        // suspended, call args.setPromise().
        app.sessionState.history = nav.history;
    };

    app.start();
})();
