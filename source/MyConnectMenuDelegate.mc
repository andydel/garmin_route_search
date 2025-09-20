using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Lang.Symbol) as Void {
        switch(item) {
            case :browse_folders:
                System.println("Browse Folders selected");
                // TODO: Implement folder browsing view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :search_routes:
                System.println("Search Routes selected");
                // Show search submenu
                WatchUi.pushView(new Rez.Menus.SearchMenu(), new SearchMenuDelegate(), WatchUi.SLIDE_UP);
                break;
            case :settings:
                System.println("Settings selected");
                // TODO: Implement settings view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
        }
    }
}