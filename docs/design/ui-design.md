# UI Design

The following is a design for the UI for the Garmin route search application. Diagrams can be found at the following link: https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#G1tTQ2kPp-F7pYtQ-LAcyHa_d3XimTXTFL

## Overview

The RouteOrganiser app follows a simple, navigation-focused design optimized for Garmin Edge cycling computers. The interface prioritizes quick access to route management and search functionality while maintaining readability during cycling activities.

## Screen Layouts

### Home Screen

The home screen serves as the primary entry point and route browsing interface.

**Key Elements:**
- **Header**: Application title "Route Organiser"
- **Route List**: Scrollable list of available routes with essential information
- **Navigation Controls**: Button mappings for quick access to main functions
- **Status Indicators**: Current selection highlight and navigation breadcrumbs

**Route List Display:**
- Route name (primary text)
- Distance and elevation gain (secondary info)
- Route type indicator (Road/Gravel/Mountain)
- Visual selection highlighting

**Button Functions:**
- **START**: Open main menu
- **SELECT**: View route details or launch navigation
- **UP/DOWN**: Navigate through route list
- **BACK**: Exit application

**Navigation Flow:**
- Default view shows recently used or favorited routes
- START button opens main menu with options:
  - Browse Folders
  - Search Routes
  - Settings

### Search Result View Page

Displays filtered routes based on search criteria with organized presentation.

**Key Elements:**
- **Search Header**: Active search criteria display
- **Results Counter**: Number of matching routes found
- **Filtered Route List**: Routes matching search parameters
- **Sort Options**: Configurable result ordering
- **Navigation Controls**: Return to search or home

**Search Results Display:**
- Highlighted search criteria at top
- Route information with search-relevant details emphasized
- Clear indication of why each route matched search criteria
- Consistent formatting with home screen for familiarity

**Search Context Display:**
- Distance range (if applicable)
- Elevation range (if applicable)
- Route type filter (if applicable)
- Location proximity (if applicable)

**Button Functions:**
- **START**: Return to search menu or refine search
- **SELECT**: View route details or launch navigation
- **UP/DOWN**: Navigate through search results
- **BACK**: Return to previous screen (search menu or home)

## Design Principles

### Garmin Edge Optimization
- **High Contrast**: Clear visibility in various lighting conditions
- **Large Text**: Readable while cycling with vibration
- **Minimal UI**: Focus on essential information only
- **Quick Navigation**: Efficient button-based interaction

### Information Hierarchy
1. **Primary**: Route names and key metrics
2. **Secondary**: Additional route details and context
3. **Tertiary**: System status and navigation aids

### Consistency
- Unified layout patterns across all screens
- Consistent button functions and navigation
- Standardized route information display
- Predictable user interaction flows

## Technical Implementation

### Current Status
- **Home Screen**: Implemented in `MyConnectView.mc`
- **Search Results**: Implemented in `SearchView.mc` with mock data
- **Navigation**: Handled by delegate classes
- **Menu System**: Hierarchical structure with main and sub-menus

### Components
- `MyConnectView`: Main route list and home screen
- `SearchView`: Search interface and results display
- `RouteListView`: Reusable route list component
- Menu delegates for navigation and interaction

### Future Enhancements
- Dynamic route loading from device storage
- Real-time search filtering
- Custom folder organization
- GPS-based location search
- Route metadata extraction and display