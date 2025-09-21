using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class FolderCreateDialog extends WatchUi.View {
    private var mFolderName as Lang.String;
    private var mSelectedButton as Lang.Number; // 0 = Create, 1 = Cancel

    function initialize() {
        View.initialize();
        mFolderName = "";
        mSelectedButton = 0;
    }

    function onLayout(dc as Graphics.Dc) as Void {
        // Skip layout since we're doing custom drawing in onUpdate
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Graphics.Dc) as Void {
        // Clear screen with semi-transparent overlay
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Draw dialog background
        var dialogWidth = dc.getWidth() - 20;
        var dialogHeight = 120;
        var dialogX = 10;
        var dialogY = (dc.getHeight() - dialogHeight) / 2;

        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_DK_GRAY);
        dc.fillRectangle(dialogX, dialogY, dialogWidth, dialogHeight);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
        dc.drawRectangle(dialogX, dialogY, dialogWidth, dialogHeight);

        // Dialog title
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dialogY + 10,
            Graphics.FONT_SMALL,
            "Create Folder",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Folder name input area
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_LT_GRAY);
        dc.fillRectangle(dialogX + 10, dialogY + 35, dialogWidth - 20, 20);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        var displayName = mFolderName.length() > 0 ? mFolderName : "Folder name...";
        dc.drawText(
            dialogX + 15,
            dialogY + 38,
            Graphics.FONT_TINY,
            displayName,
            Graphics.TEXT_JUSTIFY_LEFT
        );

        // Buttons
        var buttonY = dialogY + 70;
        var buttonWidth = (dialogWidth - 30) / 2;

        // Create button
        var createColor = (mSelectedButton == 0) ? Graphics.COLOR_GREEN : Graphics.COLOR_DK_GRAY;
        dc.setColor(createColor, createColor);
        dc.fillRectangle(dialogX + 10, buttonY, buttonWidth, 25);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dialogX + 10 + (buttonWidth / 2),
            buttonY + 3,
            Graphics.FONT_SMALL,
            "Create",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Cancel button
        var cancelColor = (mSelectedButton == 1) ? Graphics.COLOR_RED : Graphics.COLOR_DK_GRAY;
        dc.setColor(cancelColor, cancelColor);
        dc.fillRectangle(dialogX + 20 + buttonWidth, buttonY, buttonWidth, 25);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dialogX + 20 + buttonWidth + (buttonWidth / 2),
            buttonY + 3,
            Graphics.FONT_SMALL,
            "Cancel",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        // Instructions
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,
            dc.getHeight() - 15,
            Graphics.FONT_TINY,
            "LEFT/RIGHT: Button | SELECT: Confirm",
            Graphics.TEXT_JUSTIFY_CENTER
        );

        View.onUpdate(dc);
    }

    function onHide() as Void {
    }

    function moveLeft() as Void {
        mSelectedButton = 0;
        WatchUi.requestUpdate();
    }

    function moveRight() as Void {
        mSelectedButton = 1;
        WatchUi.requestUpdate();
    }

    function addCharacter(char as Lang.String) as Void {
        if (mFolderName.length() < 20) {
            mFolderName = mFolderName + char;
            WatchUi.requestUpdate();
        }
    }

    function removeCharacter() as Void {
        if (mFolderName.length() > 0) {
            mFolderName = mFolderName.substring(0, mFolderName.length() - 1);
            WatchUi.requestUpdate();
        }
    }

    function getFolderName() as Lang.String {
        return mFolderName;
    }

    function getSelectedButton() as Lang.Number {
        return mSelectedButton;
    }

    function isCreateSelected() as Lang.Boolean {
        return mSelectedButton == 0;
    }
}