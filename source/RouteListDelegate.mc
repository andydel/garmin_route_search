using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class RouteListDelegate extends WatchUi.BehaviorDelegate {
    private var mView as RouteListView;

    function initialize(view as RouteListView) {
        BehaviorDelegate.initialize();
        mView = view;
    }

    function onMenu() as Lang.Boolean {
        // Home button pressed - go back to folder list
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    function onSelect() as Lang.Boolean {
        // Handle route selection - launch navigation
        var selectedRoute = mView.getSelectedRoute();
        if (selectedRoute != null) {
            var routeName = selectedRoute.get("name") as Lang.String;
            System.println("Launching navigation for route: " + routeName);
            // TODO: Implement actual route navigation launch
        }
        return true;
    }

    function onNextPage() as Lang.Boolean {
        // Handle DOWN button - move down in route list
        mView.moveDown();
        return true;
    }

    function onPreviousPage() as Lang.Boolean {
        // Handle UP button - move up in route list
        mView.moveUp();
        return true;
    }

    function onBack() as Lang.Boolean {
        // Back button - return to folder list
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }
}