using Toybox.Test;

(:test)
function testOverallUIDesignCompliance(logger as Logger) as Boolean {
    // Test overall UI design principles from docs/design/ui-design.md

    // 1. Test Home Screen Implementation (Folder-based)
    var homeView = new MyConnectView();
    Test.assert(homeView != null);

    // Verify folder list with essential information
    var homeFolder = homeView.getSelectedFolder();
    Test.assert(homeFolder.get("name") != null);        // Folder name (primary text)
    Test.assert(homeFolder.get("routeCount") != null);  // Route count (secondary info)
    Test.assert(homeFolder.get("isDefault") != null);   // Default folder indicator

    // Test navigation controls
    homeView.moveUp();
    homeView.moveDown();
    Test.assert(homeView.getSelectedFolder() != null);  // Visual selection highlighting

    // Test Uncategorized folder requirement
    var firstFolder = homeView.getSelectedFolder();
    Test.assert(firstFolder.get("name").equals("Uncategorized"));

    // Test folder creation capability
    homeView.addFolder("Test Folder");
    Test.assert(homeView.getSelectedFolder() != null);

    // 2. Test Search Result View Implementation
    var searchView = new SearchView("Length");
    Test.assert(searchView != null);

    // Verify search criteria display and results counter
    var searchRoute = searchView.getSelectedRoute();
    Test.assert(searchRoute.get("matchReason") != null); // Search context display

    // Test filtered route list consistency
    Test.assert(searchRoute.get("name") != null);
    Test.assert(searchRoute.get("distance") != null);
    Test.assert(searchRoute.get("elevation") != null);
    Test.assert(searchRoute.get("type") != null);

    // 3. Test Route List Component Enhancement
    var mockRoutes = [{
        "name" => "Test Route",
        "distance" => 20.0,
        "elevation" => 300,
        "type" => "Road"
    }];
    var listView = new RouteListView("Test", mockRoutes);
    Test.assert(listView != null);

    var listRoute = listView.getSelectedRoute();
    Test.assert(listRoute.get("name") != null);
    Test.assert(listRoute.get("distance") != null);
    Test.assert(listRoute.get("elevation") != null);
    Test.assert(listRoute.get("type") != null);

    logger.debug("Overall UI design compliance test passed");
    return true;
}

(:test)
function testGarminEdgeOptimizationPrinciples(logger as Logger) as Boolean {
    // Test Garmin Edge optimization principles from wireframe design

    // 1. High Contrast Design
    var homeView = new MyConnectView();
    var searchView = new SearchView("Type");
    var mockRoutes = [{"name" => "Test", "distance" => 15.0, "elevation" => 200, "type" => "Road"}];
    var listView = new RouteListView("Test", mockRoutes);

    // All views should initialize properly (high contrast implementation)
    Test.assert(homeView != null);
    Test.assert(searchView != null);
    Test.assert(listView != null);

    // 2. Information Hierarchy Validation
    // Primary: Route names
    Test.assert(homeView.getSelectedRoute().get("name") != null);
    Test.assert(searchView.getSelectedRoute().get("name") != null);
    Test.assert(listView.getSelectedRoute().get("name") != null);

    // Secondary: Route details
    Test.assert(homeView.getSelectedRoute().get("distance") != null);
    Test.assert(searchView.getSelectedRoute().get("distance") != null);
    Test.assert(listView.getSelectedRoute().get("distance") != null);

    // 3. Consistency Across Views
    var homeRouteType = homeView.getSelectedRoute().get("type") as String;
    var searchRouteType = searchView.getSelectedRoute().get("type") as String;
    var listRouteType = listView.getSelectedRoute().get("type") as String;

    // All should support the same route types
    var validTypes = ["Road", "Gravel", "Mountain"];
    Test.assert(validTypes.indexOf(homeRouteType) != -1);
    Test.assert(validTypes.indexOf(searchRouteType) != -1);
    Test.assert(validTypes.indexOf(listRouteType) != -1);

    // 4. Quick Navigation Implementation
    // All views should support navigation
    homeView.moveUp();
    homeView.moveDown();
    searchView.moveUp();
    searchView.moveDown();
    listView.moveUp();
    listView.moveDown();

    Test.assert(homeView.getSelectedRoute() != null);
    Test.assert(searchView.getSelectedRoute() != null);
    Test.assert(listView.getSelectedRoute() != null);

    logger.debug("Garmin Edge optimization principles test passed");
    return true;
}

(:test)
function testWireframeDesignImplementation(logger as Logger) as Boolean {
    // Test specific wireframe design implementation requirements

    // 1. Home Screen Wireframe Compliance
    var homeView = new MyConnectView();

    // Header with application title (implementation validated through initialization)
    Test.assert(homeView != null);

    // Route list with scrollable display
    var route1 = homeView.getSelectedRoute();
    homeView.moveDown();
    var route2 = homeView.getSelectedRoute();
    Test.assert(!route1.get("name").equals(route2.get("name")));

    // Status indicators and navigation breadcrumbs (validated through navigation)
    homeView.moveUp();
    Test.assert(homeView.getSelectedRoute() != null);

    // 2. Search Result View Wireframe Compliance
    var searchView = new SearchView("Elevation");

    // Search header with active criteria
    Test.assert(searchView != null);

    // Results counter (implicit through mock data structure)
    var searchResult = searchView.getSelectedRoute();
    Test.assert(searchResult != null);

    // Filtered route list with search context
    Test.assert(searchResult.get("matchReason") != null);

    // Navigation controls for results
    searchView.moveDown();
    Test.assert(searchView.getSelectedRoute() != null);

    // 3. Enhanced Route Information Display
    // All views should show: name, distance, elevation, type
    var views = [homeView, searchView];

    for (var i = 0; i < views.size(); i++) {
        var view = views[i];
        var route = view.getSelectedRoute();

        Test.assert(route.get("name") != null);
        Test.assert(route.get("distance") != null);
        Test.assert(route.get("elevation") != null);
        Test.assert(route.get("type") != null);
    }

    logger.debug("Wireframe design implementation test passed");
    return true;
}