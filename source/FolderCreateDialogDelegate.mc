using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class FolderCreateDialogDelegate extends WatchUi.BehaviorDelegate {
    private var mParentView as MyConnectView;

    function initialize(parentView as MyConnectView) {
        BehaviorDelegate.initialize();
        mParentView = parentView;
    }

    function onSelect() as Lang.Boolean {
        // Handle Create button or confirm folder creation
        // For now, create a default folder name
        var folderName = "New Folder";
        mParentView.addFolder(folderName);

        // Close the dialog
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    function onBack() as Lang.Boolean {
        // Handle Cancel button or close dialog
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }

    function onMenu() as Lang.Boolean {
        // Alternative way to cancel
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
}