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
        // Get and show the current time
        var clockTime = System.getClockTime();
        var timeString = Lang.format("$1$:$2$", [clockTime.hour, clockTime.min.format("%02d")]);
        
        // Clear the screen
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        
        // Set text color and font
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2 - 30,
            Graphics.FONT_MEDIUM,
            "My Garmin App",
            Graphics.TEXT_JUSTIFY_CENTER
        );
        
        // Display current time
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() / 2 + 10,
            Graphics.FONT_SMALL,
            timeString,
            Graphics.TEXT_JUSTIFY_CENTER
        );
        
        // Display instructions
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 40,
            Graphics.FONT_TINY,
            "Press START for menu",
            Graphics.TEXT_JUSTIFY_CENTER
        );
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen
    function onHide() as Void {
    }
}