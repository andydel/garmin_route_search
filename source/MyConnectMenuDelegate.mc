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
            case :create_folder:
                System.println("Create Folder selected");
                // Open folder creation dialog
                openFolderCreateDialog();
                break;
            case :settings:
                System.println("Settings selected");
                // TODO: Implement settings view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
        }
    }

    private function openFolderCreateDialog() as Void {
        // Get the main view reference
        var app = getApp();
        var initialView = app.getInitialView();
        var mainView = initialView[0] as MyConnectView;

        var dialog = new FolderCreateDialog();
        var dialogDelegate = new FolderCreateDialogDelegate(mainView);
        WatchUi.pushView(dialog, dialogDelegate, WatchUi.SLIDE_UP);
    }
}