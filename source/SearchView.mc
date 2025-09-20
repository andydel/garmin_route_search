using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class SearchView extends WatchUi.View {
    private var mSearchType as Lang.String;
    private var mCurrentValue as Lang.String;
    private var mResults as Lang.Array;

    function initialize(searchType as Lang.String) {
        View.initialize();
        mSearchType = searchType;
        mCurrentValue = "";
        mResults = [];
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
            "Search: " + mSearchType,
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Search criteria display
        var yPos = 50;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);

        switch(mSearchType) {
            case "Length":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Distance Range:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 20, Graphics.FONT_SMALL, "10-30 km", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Elevation":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Elevation Gain:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 20, Graphics.FONT_SMALL, "500-1000m", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Type":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Route Type:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 20, Graphics.FONT_SMALL, "Road", Graphics.TEXT_JUSTIFY_LEFT);
                break;

            case "Location":
                dc.drawText(10, yPos, Graphics.FONT_TINY, "Near Location:", Graphics.TEXT_JUSTIFY_LEFT);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
                dc.drawText(10, yPos + 20, Graphics.FONT_SMALL, "Current GPS", Graphics.TEXT_JUSTIFY_LEFT);
                break;
        }

        // Mock search results
        yPos = 100;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(10, yPos, Graphics.FONT_TINY, "Results (3 found):", Graphics.TEXT_JUSTIFY_LEFT);

        var mockResults = [
            "Scenic Loop - 22km",
            "Training Route - 28km",
            "Quick Ride - 15km"
        ];

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        for (var i = 0; i < mockResults.size(); i++) {
            dc.drawText(
                15,
                yPos + 20 + (i * 20),
                Graphics.FONT_XTINY,
                mockResults[i],
                Graphics.TEXT_JUSTIFY_LEFT
            );
        }

        // Instructions
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 25,
            Graphics.FONT_TINY,
            "BACK: Return | SELECT: Modify",
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
}