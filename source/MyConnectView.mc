using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectView extends WatchUi.View {
    private var mSelectedIndex as Lang.Number;
    private var mRoutes as Lang.Array;

    function initialize() {
        View.initialize();
        mSelectedIndex = 0;
        mRoutes = [
            {
                "name" => "Morning Loop",
                "distance" => 25.3,
                "elevation" => 456,
                "type" => "Road"
            },
            {
                "name" => "Hill Climb Challenge",
                "distance" => 15.8,
                "elevation" => 892,
                "type" => "Mountain"
            },
            {
                "name" => "Coastal Ride",
                "distance" => 42.1,
                "elevation" => 234,
                "type" => "Road"
            },
            {
                "name" => "Gravel Explorer",
                "distance" => 18.7,
                "elevation" => 567,
                "type" => "Gravel"
            },
            {
                "name" => "City Circuit",
                "distance" => 12.4,
                "elevation" => 89,
                "type" => "Road"
            }
        ];
    }

    function onLayout(dc as Graphics.Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        // Clear screen with high contrast black background
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Header with application title - high contrast white text
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            5,
            Graphics.FONT_MEDIUM,
            "Route Organiser",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Route list section header
        var yPos = 45;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(10, yPos, Graphics.FONT_TINY, "Recent Routes:", Graphics.TEXT_JUSTIFY_LEFT);

        // Route list display with enhanced information
        yPos = 65;
        var itemHeight = 35;
        var visibleItems = 4;

        for (var i = 0; i < mRoutes.size() && i < visibleItems; i++) {
            var route = mRoutes[i] as Lang.Dictionary;
            var currentY = yPos + (i * itemHeight);

            // Highlight selected route with visual selection
            if (i == mSelectedIndex) {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
                dc.fillRectangle(5, currentY - 3, dc.getWidth() - 10, itemHeight - 2);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            }

            // Route name (primary text) - larger font for readability
            dc.drawText(
                10,
                currentY,
                Graphics.FONT_SMALL,
                route.get("name") as Lang.String,
                Graphics.TEXT_JUSTIFY_LEFT
            );

            // Distance and elevation gain (secondary info)
            var distance = route.get("distance") as Lang.Float;
            var elevation = route.get("elevation") as Lang.Number;
            var routeType = route.get("type") as Lang.String;
            var details = distance.format("%.1f") + "km • " +
                         elevation + "m • " + routeType;

            if (i == mSelectedIndex) {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            }

            dc.drawText(
                10,
                currentY + 15,
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
            } else {
                typeColor = Graphics.COLOR_GREEN;
            }

            dc.setColor(typeColor, typeColor);
            dc.fillRectangle(dc.getWidth() - 15, currentY + 5, 8, 8);
        }

        // Navigation breadcrumbs and status
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        var statusText = (mSelectedIndex + 1) + "/" + mRoutes.size();
        dc.drawText(
            dc.getWidth() - 10,
            10,
            Graphics.FONT_TINY,
            statusText,
            Graphics.TEXT_JUSTIFY_RIGHT
        );

        // Button function instructions - optimized for Garmin Edge
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 25,
            Graphics.FONT_TINY,
            "START: Menu | SELECT: Launch | ↑↓: Navigate",
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