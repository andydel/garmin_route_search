using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;

class MyConnectApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Lang.Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Lang.Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() {
        var view = new MyConnectView();
        var delegate = new MyConnectDelegate(view);
        return [ view, delegate ];
    }
}

function getApp() as MyConnectApp {
    return Application.getApp() as MyConnectApp;
}