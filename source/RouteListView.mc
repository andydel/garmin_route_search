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

        // Route list with enhanced spacing for detailed display
        var yStart = 40;
        var itemHeight = 35;
        var visibleItems = 5;

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

                // Enhanced route display with detailed information
                var route = mRoutes[i] as Lang.Dictionary;

                // Route name (primary text) - larger font for readability
                dc.drawText(
                    10,
                    yPos,
                    Graphics.FONT_SMALL,
                    route.get("name") as Lang.String,
                    Graphics.TEXT_JUSTIFY_LEFT
                );

                // Distance, elevation, and type (secondary info)
                var distance = route.get("distance") as Lang.Float;
                var elevation = route.get("elevation") as Lang.Number;
                var routeType = route.get("type") as Lang.String;
                var details = distance.format("%.1f") + "km • " +
                             elevation + "m • " + routeType;

                // Adjust text color for selected vs unselected
                if (i == mSelectedIndex) {
                    dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
                } else {
                    dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
                }

                dc.drawText(
                    10,
                    yPos + 15,
                    Graphics.FONT_XTINY,
                    details,
                    Graphics.TEXT_JUSTIFY_LEFT
                );

                // Route type indicator (visual marker)
                var typeColor = Graphics.COLOR_LT_GRAY;
                if (routeType.equals("Mountain")) {
                    typeColor = Graphics.COLOR_RED;
                } else if (routeType.equals("Gravel")) {
                    typeColor = Graphics.COLOR_ORANGE;
                } else if (routeType.equals("Road")) {
                    typeColor = Graphics.COLOR_GREEN;
                }

                dc.setColor(typeColor, typeColor);
                dc.fillRectangle(dc.getWidth() - 15, yPos + 5, 8, 8);
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