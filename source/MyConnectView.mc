using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Graphics.Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Graphics.Dc) as Void {
        // Clear the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Set text color and font
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        // App title
        dc.drawText(
            dc.getWidth() / 2,
            20,
            Graphics.FONT_SMALL,
            "Route Organiser",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Mock route list display
        var yPos = 60;
        var routes = [
            "Morning Loop - 25km",
            "Hill Climb - 15km",
            "Coastal Ride - 40km",
            "City Circuit - 12km"
        ];

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(10, yPos - 20, Graphics.FONT_TINY, "Recent Routes:", Graphics.TEXT_JUSTIFY_LEFT);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        for (var i = 0; i < routes.size() && i < 4; i++) {
            dc.drawText(
                15,
                yPos + (i * 25),
                Graphics.FONT_XTINY,
                routes[i],
                Graphics.TEXT_JUSTIFY_LEFT
            );
        }

        // Display instructions
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 25,
            Graphics.FONT_TINY,
            "START: Menu | SELECT: Details",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen
    function onHide() as Void {
    }
}