using Toybox.WatchUi;
using Toybox.System;
using Toybox.Lang;

class MyConnectDelegate extends WatchUi.BehaviorDelegate {
    private var mView as MyConnectView;

    function initialize(view as MyConnectView) {
        BehaviorDelegate.initialize();
        mView = view;
    }

    function onMenu() as Lang.Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MyConnectMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Lang.Boolean {
        // Handle folder selection - open folder contents
        var selectedFolder = mView.getSelectedFolder();
        if (selectedFolder != null) {
            var folderName = selectedFolder.get("name") as Lang.String;
            System.println("Opening folder: " + folderName);

            // Create mock routes for the selected folder
            var mockRoutes = createMockRoutesForFolder(folderName);

            // Push RouteListView to show folder contents
            var routeListView = new RouteListView(folderName, mockRoutes);
            var routeListDelegate = new RouteListDelegate(routeListView);
            WatchUi.pushView(routeListView, routeListDelegate, WatchUi.SLIDE_LEFT);
        }
        return true;
    }

    function onNextPage() as Lang.Boolean {
        // Handle DOWN button - move down in folder list
        mView.moveDown();
        return true;
    }

    function onPreviousPage() as Lang.Boolean {
        // Handle UP button - move up in folder list
        mView.moveUp();
        return true;
    }

    function onBack() as Lang.Boolean {
        // Exit the application
        System.exit();
        return true;
    }

    private function createMockRoutesForFolder(folderName as Lang.String) as Lang.Array {
        // Create mock routes based on folder name
        if (folderName.equals("Uncategorized")) {
            return [
                {"name" => "Morning Loop", "distance" => 25.3, "elevation" => 456, "type" => "Road"},
                {"name" => "Evening Ride", "distance" => 18.7, "elevation" => 234, "type" => "Road"},
                {"name" => "Quick Circuit", "distance" => 12.1, "elevation" => 123, "type" => "Road"}
            ];
        } else if (folderName.equals("Training Routes")) {
            return [
                {"name" => "Hill Intervals", "distance" => 22.5, "elevation" => 892, "type" => "Mountain"},
                {"name" => "Endurance Base", "distance" => 45.2, "elevation" => 567, "type" => "Road"},
                {"name" => "Sprint Training", "distance" => 15.8, "elevation" => 234, "type" => "Road"}
            ];
        } else if (folderName.equals("Weekend Adventures")) {
            return [
                {"name" => "Coastal Exploration", "distance" => 62.4, "elevation" => 678, "type" => "Gravel"},
                {"name" => "Mountain Challenge", "distance" => 38.9, "elevation" => 1245, "type" => "Mountain"},
                {"name" => "Scenic Backroads", "distance" => 55.1, "elevation" => 445, "type" => "Gravel"}
            ];
        } else {
            // Default routes for other folders
            return [
                {"name" => "Sample Route 1", "distance" => 20.0, "elevation" => 300, "type" => "Road"},
                {"name" => "Sample Route 2", "distance" => 15.5, "elevation" => 200, "type" => "Road"}
            ];
        }
    }
}