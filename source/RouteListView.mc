using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class RouteListView extends WatchUi.View {
    private var mTitle as Lang.String;
    private var mRoutes as Lang.Array;
    private var mSelectedIndex as Lang.Number;

    function initialize(title as Lang.String, routes as Lang.Array) {
        View.initialize();
        mTitle = title;
        mRoutes = routes;
        mSelectedIndex = 0;
    }

    function onLayout(dc as Graphics.Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        // Clear the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Set text color and font
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        // Title
        dc.drawText(
            dc.getWidth() / 2,
            10,
            Graphics.FONT_SMALL,
            mTitle,
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Route list
        var yStart = 40;
        var itemHeight = 25;
        var visibleItems = 6;

        if (mRoutes.size() == 0) {
            dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                dc.getWidth() / 2,
                dc.getHeight() / 2,
                Graphics.FONT_SMALL,
                "No routes found",
                Graphics.TEXT_JUSTIFY_CENTER
            );
        } else {
            for (var i = 0; i < mRoutes.size() && i < visibleItems; i++) {
                var yPos = yStart + (i * itemHeight);

                // Highlight selected item
                if (i == mSelectedIndex) {
                    dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
                    dc.fillRectangle(5, yPos - 2, dc.getWidth() - 10, itemHeight - 2);
                    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                } else {
                    dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
                }

                // Route name and details
                var route = mRoutes[i] as Lang.Dictionary;
                var routeText = route.get("name") + " - " + route.get("distance") + "km";

                dc.drawText(
                    10,
                    yPos,
                    Graphics.FONT_XTINY,
                    routeText,
                    Graphics.TEXT_JUSTIFY_LEFT
                );
            }
        }

        // Instructions
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 25,
            Graphics.FONT_TINY,
            "UP/DOWN: Navigate | SELECT: Launch",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        View.onUpdate(dc);
    }

    function onHide() as Void {
    }

    function moveUp() as Void {
        if (mSelectedIndex > 0) {
            mSelectedIndex--;
            WatchUi.requestUpdate();
        }
    }

    function moveDown() as Void {
        if (mSelectedIndex < mRoutes.size() - 1) {
            mSelectedIndex++;
            WatchUi.requestUpdate();
        }
    }

    function getSelectedRoute() as Lang.Dictionary? {
        if (mRoutes.size() > 0 && mSelectedIndex < mRoutes.size()) {
            return mRoutes[mSelectedIndex] as Lang.Dictionary;
        }
        return null;
    }
}