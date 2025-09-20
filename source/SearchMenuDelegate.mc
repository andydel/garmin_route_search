using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class SearchMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Lang.Symbol) as Void {
        switch(item) {
            case :search_length:
                System.println("Search by Length selected");
                // TODO: Implement length search view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :search_elevation:
                System.println("Search by Elevation selected");
                // TODO: Implement elevation search view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :search_type:
                System.println("Search by Type selected");
                // TODO: Implement type search view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
            case :search_location:
                System.println("Search by Location selected");
                // TODO: Implement location search view
                WatchUi.popView(WatchUi.SLIDE_DOWN);
                break;
        }
    }
}