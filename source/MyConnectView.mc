using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectView extends WatchUi.View {
    private var mSelectedIndex as Lang.Number;
    private var mFolders as Lang.Array;

    function initialize() {
        View.initialize();
        mSelectedIndex = 0;
        mFolders = [
            {
                "name" => "Uncategorized",
                "routeCount" => 12,
                "isDefault" => true
            },
            {
                "name" => "Training Routes",
                "routeCount" => 8,
                "isDefault" => false
            },
            {
                "name" => "Weekend Adventures",
                "routeCount" => 5,
                "isDefault" => false
            },
            {
                "name" => "Commute Routes",
                "routeCount" => 3,
                "isDefault" => false
            },
            {
                "name" => "Race Courses",
                "routeCount" => 7,
                "isDefault" => false
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

        // Search box area
        var yPos = 45;
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
        dc.fillRectangle(10, yPos, dc.getWidth() - 20, 20);
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(15, yPos + 3, Graphics.FONT_TINY, "Search routes...", Graphics.TEXT_JUSTIFY_LEFT);

        // Plus button for folder creation (top right)
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_GREEN);
        dc.fillRectangle(dc.getWidth() - 25, 10, 15, 15);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc.getWidth() - 17, 11, Graphics.FONT_TINY, "+", Graphics.TEXT_JUSTIFY_CENTER);

        // Folder list section header
        yPos = 75;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(10, yPos, Graphics.FONT_TINY, "Folders:", Graphics.TEXT_JUSTIFY_LEFT);

        // Folder list display
        yPos = 95;
        var itemHeight = 30;
        var visibleItems = 4;

        for (var i = 0; i < mFolders.size() && i < visibleItems; i++) {
            var folder = mFolders[i] as Lang.Dictionary;
            var currentY = yPos + (i * itemHeight);

            // Highlight selected folder with visual selection
            if (i == mSelectedIndex) {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
                dc.fillRectangle(5, currentY - 3, dc.getWidth() - 10, itemHeight - 2);
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            }

            // Folder name (primary text) - larger font for readability
            dc.drawText(
                10,
                currentY,
                Graphics.FONT_SMALL,
                folder.get("name") as Lang.String,
                Graphics.TEXT_JUSTIFY_LEFT
            );

            // Route count (secondary info)
            var routeCount = folder.get("routeCount") as Lang.Number;
            var countText = routeCount + " routes";

            if (i == mSelectedIndex) {
                dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            }

            dc.drawText(
                10,
                currentY + 15,
                Graphics.FONT_XTINY,
                countText,
                Graphics.TEXT_JUSTIFY_LEFT
            );

            // Folder indicator (visual marker)
            var isDefault = folder.get("isDefault") as Lang.Boolean;
            var folderColor = isDefault ? Graphics.COLOR_BLUE : Graphics.COLOR_YELLOW;

            dc.setColor(folderColor, folderColor);
            dc.fillRectangle(dc.getWidth() - 15, currentY + 5, 8, 8);
        }

        // Navigation breadcrumbs and status
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        var statusText = (mSelectedIndex + 1) + "/" + mFolders.size();
        dc.drawText(
            dc.getWidth() - 35,
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
            "START: Menu | SELECT: Open | ↑↓: Navigate",
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
        if (mSelectedIndex < mFolders.size() - 1) {
            mSelectedIndex++;
            WatchUi.requestUpdate();
        }
    }

    function getSelectedFolder() as Lang.Dictionary? {
        if (mFolders.size() > 0 && mSelectedIndex < mFolders.size()) {
            return mFolders[mSelectedIndex] as Lang.Dictionary;
        }
        return null;
    }

    function addFolder(folderName as Lang.String) as Void {
        var newFolder = {
            "name" => folderName,
            "routeCount" => 0,
            "isDefault" => false
        };
        mFolders.add(newFolder);
        WatchUi.requestUpdate();
    }
}