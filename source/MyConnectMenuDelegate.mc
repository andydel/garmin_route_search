using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Lang.Symbol) as Void {
        switch(item) {
            case :item_1:
                System.println("Menu Item 1 selected");
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :item_2:
                System.println("Menu Item 2 selected");
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :settings:
                System.println("Settings selected");
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
        }
    }
}