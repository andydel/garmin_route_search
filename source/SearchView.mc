using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class SearchView extends WatchUi.View {
    private var mSearchType as Lang.String;
    private var mCurrentValue as Lang.String;
    private var mResults as Lang.Array;
    private var mSelectedIndex as Lang.Number;

    function initialize(searchType as Lang.String) {
        View.initialize();
        mSearchType = searchType;
        mCurrentValue = "";
        mSelectedIndex = 0;
        mResults = [
            {
                "name" => "Scenic Loop",
                "distance" => 22.1,
                "elevation" => 345,
                "type" => "Road",
                "matchReason" => "Distance: 22.1km in range"
            },
            {
                "name" => "Training Route",
                "distance" => 28.5,
                "elevation" => 567,
                "type" => "Road",
                "matchReason" => "Distance: 28.5km in range"
            },
            {
                "name" => "Quick Ride",
                "distance" => 15.2,
                "elevation" => 198,
                "type" => "Road",
                "matchReason" => "Distance: 15.2km in range"
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

        // Search header with active criteria display
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            5,
            Graphics.FONT_MEDIUM,
            "Search: " + mSearchType,
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Active search criteria display
        var yPos = 35;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);

        switch(mSearchType) {
            case "Length":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Distance Range:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 15, Graphics.FONT_SMALL, "10-30 km", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Elevation":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Elevation Gain:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 15, Graphics.FONT_SMALL, "500-1000m", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Type":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Route Type:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 15, Graphics.FONT_SMALL, "Road", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Location":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Near Location:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 15, Graphics.FONT_SMALL, "Current GPS", Graphics.TEXT_JUSTIFY_LEFT);
                break;
        }

        // Results counter
        yPos = 75;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(10, yPos, Graphics.FONT_TINY, "Results (" + mResults.size() + " found):", Graphics.TEXT_JUSTIFY_LEFT);

        // Filtered route list with enhanced display
        yPos = 95;
        var itemHeight = 35;
        var visibleItems = 3;

        for (var i = 0; i < mResults.size() && i < visibleItems; i++) {
            var route = mResults[i] as Lang.Dictionary;
            var currentY = yPos + (i * itemHeight);

            // Highlight selected result with visual selection
            if (i == mSelectedIndex) {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
                dc.fillRectangle(5, currentY - 3, dc.getWidth() - 10, itemHeight - 2);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            }

            // Route name (primary text)
            dc.drawText(
                10,
                currentY,
                Graphics.FONT_SMALL,
                route.get("name") as Lang.String,
                Graphics.TEXT_JUSTIFY_LEFT
            );

            // Route details with search-relevant emphasis
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

            // Route type indicator consistent with other views
            var typeColor = Graphics.COLOR_LT_GRAY;
            if (routeType.equals("Mountain")) {
                typeColor = Graphics.COLOR_RED;
            } else if (routeType.equals("Gravel")) {
                typeColor = Graphics.COLOR_ORANGE;
            } else if (routeType.equals("Road")) {
                typeColor = Graphics.COLOR_GREEN;
            }

            dc.setColor(typeColor, typeColor);
            dc.fillRectangle(dc.getWidth() - 15, currentY + 5, 8, 8);
        }

        // Navigation controls optimized for Garmin Edge
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 25,
            Graphics.FONT_TINY,
            "BACK: Return | SELECT: Launch | ↑↓: Navigate",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        View.onUpdate(dc);
    }

    function onHide() as Void {
    }

    function updateSearchValue(value as Lang.String) as Void {
        mCurrentValue = value;
        WatchUi.requestUpdate();
    }

    function performSearch() as Void {
        // TODO: Implement actual search logic
        System.println("Performing search for: " + mSearchType + " with value: " + mCurrentValue);
    }

    function moveUp() as Void {
        if (mSelectedIndex > 0) {
            mSelectedIndex--;
            WatchUi.requestUpdate();
        }
    }

    function moveDown() as Void {
        if (mSelectedIndex < mResults.size() - 1) {
            mSelectedIndex++;
            WatchUi.requestUpdate();
        }
    }

    function getSelectedRoute() as Lang.Dictionary? {
        if (mResults.size() > 0 && mSelectedIndex < mResults.size()) {
            return mResults[mSelectedIndex] as Lang.Dictionary;
        }
        return null;
    }
}