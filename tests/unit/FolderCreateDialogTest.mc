using Toybox.Test;
using Toybox.Graphics;
using Toybox.WatchUi;

(:test)
function testFolderCreateDialogInitialization(logger as Logger) as Boolean {
    var dialog = new FolderCreateDialog();

    // Test initialization
    Test.assert(dialog != null);

    // Test initial state
    Test.assert(dialog.getFolderName().equals(""));
    Test.assert(dialog.getSelectedButton() == 0); // Create button selected by default
    Test.assert(dialog.isCreateSelected() == true);

    logger.debug("FolderCreateDialog initialization test passed");
    return true;
}

(:test)
function testFolderCreateDialogNavigation(logger as Logger) as Boolean {
    var dialog = new FolderCreateDialog();

    // Test initial button selection (Create)
    Test.assert(dialog.isCreateSelected() == true);

    // Test moving to Cancel button
    dialog.moveRight();
    Test.assert(dialog.isCreateSelected() == false);
    Test.assert(dialog.getSelectedButton() == 1);

    // Test moving back to Create button
    dialog.moveLeft();
    Test.assert(dialog.isCreateSelected() == true);
    Test.assert(dialog.getSelectedButton() == 0);

    logger.debug("FolderCreateDialog navigation test passed");
    return true;
}

(:test)
function testFolderCreateDialogTextInput(logger as Logger) as Boolean {
    var dialog = new FolderCreateDialog();

    // Test adding characters
    dialog.addCharacter("T");
    dialog.addCharacter("e");
    dialog.addCharacter("s");
    dialog.addCharacter("t");

    Test.assert(dialog.getFolderName().equals("Test"));

    // Test removing characters
    dialog.removeCharacter();
    Test.assert(dialog.getFolderName().equals("Tes"));

    // Test removing all characters
    dialog.removeCharacter();
    dialog.removeCharacter();
    dialog.removeCharacter();
    Test.assert(dialog.getFolderName().equals(""));

    logger.debug("FolderCreateDialog text input test passed");
    return true;
}

(:test)
function testFolderCreateDialogMaxLength(logger as Logger) as Boolean {
    var dialog = new FolderCreateDialog();

    // Test maximum length constraint (20 characters)
    for (var i = 0; i < 25; i++) {
        dialog.addCharacter("A");
    }

    // Should be limited to 20 characters
    Test.assert(dialog.getFolderName().length() == 20);

    logger.debug("FolderCreateDialog max length test passed");
    return true;
}

(:test)
function testFolderCreateDialogWireframeCompliance(logger as Logger) as Boolean {
    var dialog = new FolderCreateDialog();

    // Test wireframe requirements:
    // 1. Folder name input
    Test.assert(dialog.getFolderName() != null);

    // 2. Create and Cancel buttons
    Test.assert(dialog.getSelectedButton() >= 0 && dialog.getSelectedButton() <= 1);

    // 3. Button navigation
    dialog.moveLeft();
    dialog.moveRight();
    Test.assert(dialog.getSelectedButton() >= 0 && dialog.getSelectedButton() <= 1);

    // 4. Text input functionality
    dialog.addCharacter("W");
    dialog.addCharacter("F");
    Test.assert(dialog.getFolderName().equals("WF"));

    logger.debug("FolderCreateDialog wireframe compliance test passed");
    return true;
}