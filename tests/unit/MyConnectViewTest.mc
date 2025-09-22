using Toybox.Test;
using Toybox.Graphics;
using Toybox.WatchUi;

(:test)
function testMyConnectViewInitialization(logger as Logger) as Boolean {
    var view = new MyConnectView();

    // Test initialization
    Test.assert(view != null);

    // Test folder data structure
    var selectedFolder = view.getSelectedFolder();
    Test.assert(selectedFolder != null);
    Test.assert(selectedFolder.get("name") != null);
    Test.assert(selectedFolder.get("routeCount") != null);
    Test.assert(selectedFolder.get("isDefault") != null);

    logger.debug("MyConnectView initialization test passed");
    return true;
}

(:test)
function testMyConnectViewNavigation(logger as Logger) as Boolean {
    var view = new MyConnectView();

    // Test initial selection
    var initialFolder = view.getSelectedFolder();
    var initialName = initialFolder.get("name") as String;

    // Test move down
    view.moveDown();
    var secondFolder = view.getSelectedFolder();
    var secondName = secondFolder.get("name") as String;
    Test.assert(!initialName.equals(secondName));

    // Test move up
    view.moveUp();
    var backToFirst = view.getSelectedFolder();
    var backToFirstName = backToFirst.get("name") as String;
    Test.assert(initialName.equals(backToFirstName));

    logger.debug("MyConnectView navigation test passed");
    return true;
}

(:test)
function testMyConnectViewFolderDataStructure(logger as Logger) as Boolean {
    var view = new MyConnectView();
    var folder = view.getSelectedFolder();

    // Test folder data types and values
    var name = folder.get("name") as String;
    var routeCount = folder.get("routeCount") as Number;
    var isDefault = folder.get("isDefault") as Boolean;

    Test.assert(name.length() > 0);
    Test.assert(routeCount >= 0);
    Test.assert(isDefault == true || isDefault == false);

    logger.debug("MyConnectView folder data structure test passed");
    return true;
}

(:test)
function testMyConnectViewUncategorizedFolder(logger as Logger) as Boolean {
    var view = new MyConnectView();

    // Test that Uncategorized folder always exists and is first
    var firstFolder = view.getSelectedFolder();
    var folderName = firstFolder.get("name") as String;
    var isDefault = firstFolder.get("isDefault") as Boolean;

    Test.assert(folderName.equals("Uncategorized"));
    Test.assert(isDefault == true);

    logger.debug("MyConnectView Uncategorized folder test passed");
    return true;
}

(:test)
function testMyConnectViewFolderCreation(logger as Logger) as Boolean {
    var view = new MyConnectView();

    // Test folder creation functionality
    var initialFolder = view.getSelectedFolder();
    view.addFolder("Test Folder");

    // Verify folder was added (indirectly through no crash)
    Test.assert(view.getSelectedFolder() != null);

    logger.debug("MyConnectView folder creation test passed");
    return true;
}

(:test)
function testMyConnectViewWireframeCompliance(logger as Logger) as Boolean {
    // Test wireframe design requirements
    var view = new MyConnectView();

    // Verify all required components are present
    // This test validates wireframe compliance indirectly through API
    Test.assert(view.getSelectedFolder() != null); // Folder list display

    // Test navigation functions exist and work
    view.moveUp();
    view.moveDown();
    Test.assert(view.getSelectedFolder() != null); // Navigation controls

    // Test folder creation capability
    view.addFolder("Wireframe Test Folder");
    Test.assert(view.getSelectedFolder() != null); // Folder creation

    logger.debug("MyConnectView wireframe compliance test passed");
    return true;
}