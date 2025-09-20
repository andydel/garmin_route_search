using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Lang.Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MyConnectMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Lang.Boolean {
        // Handle select button press
        System.println("Select button pressed");
        return true;
    }

    function onBack() as Lang.Boolean {
        // Exit the application
        System.exit();
        return true;
    }
}