# Garmin Route Organiser - Connect IQ Application

A comprehensive route management application for Garmin Edge cycling computers that helps cyclists organize, search, and launch their saved routes efficiently.

## Features

- **Organize in folders**: Create custom folders to group and categorize your routes for easy browsing
- **Search by length**: Find routes within specific distance ranges to match your planned ride duration
- **Search by elevation**: Filter routes by climbing difficulty to match your fitness goals and terrain preferences
- **Search by ride type**: Categorize and find routes by type - Road, Gravel, Mountain bike, etc.
- **Search by location**: Discover routes near your current location or any specified area using GPS coordinates
- **Launch navigation**: Seamlessly start Garmin navigation for any selected route with one button press

## Supported Devices

- Garmin Edge 540
- Garmin Edge 840

## Requirements

- **Garmin Connect IQ SDK**: Version 8.2.3 or later
- **Developer Key**: Needs to be provided
- **MonkeyC Compiler**: Included with Connect IQ SDK

## Building the App

**Prerequisites:**
- Replace `{connectiq_sdk_path}` with your Connect IQ SDK installation path
- Replace `{developer_key_path}` with the path to your developer key file

### Compile for Edge 840:
```bash
export SDK_PATH="{connectiq_sdk_path}"
"${SDK_PATH}/bin/monkeyc" -f monkey.jungle -d edge840 -o bin/RouteOrganiser.prg -y {developer_key_path}
```

### Run in Simulator:
```bash
# Launch simulator
"${SDK_PATH}/bin/connectiq" &

# Load app into simulator
"${SDK_PATH}/bin/monkeydo" bin/RouteOrganiser.prg edge840
```

## File Structure

```
RouteOrganiser/
├── source/                      # MonkeyC source files
│   ├── MyConnectApp.mc         # Main application class
│   ├── MyConnectView.mc        # Main route list display
│   ├── MyConnectDelegate.mc    # Button input handling
│   ├── MyConnectMenuDelegate.mc # Main menu interaction
│   ├── SearchMenuDelegate.mc   # Search submenu handling
│   ├── RouteListView.mc        # Route list component
│   └── SearchView.mc           # Search interface component
├── resources/                  # Application resources
│   ├── drawables/             # Icons and images
│   ├── layouts/               # UI layouts
│   ├── menus/                 # Menu definitions (main + search)
│   └── strings/               # Route management strings
├── bin/                       # Compiled output
├── manifest.xml               # App metadata and permissions
└── monkey.jungle              # Build configuration
```

## Controls

- **START Button**: Open main menu from route list
- **SELECT Button**: View route details or launch selected route
- **UP/DOWN Buttons**: Navigate through route lists
- **BACK Button**: Return to previous screen or exit application

## Menu Structure

### Main Menu
1. **Browse Folders**: Navigate through organized route folders
2. **Search Routes**: Access search options by various criteria
3. **Settings**: Configure app preferences and folder management

### Search Submenu
1. **Search by Length**: Find routes within distance ranges (e.g., 10-30km)
2. **Search by Elevation**: Filter by climbing difficulty (e.g., 500-1000m gain)
3. **Search by Type**: Filter by route category (Road, Gravel, Mountain)
4. **Search by Location**: Find routes near current or specified location

## Permissions

- **Positioning**: Access to GPS location data
- **UserProfile**: Access to user profile information

## Current Status

**UI Implementation Complete** - The application now features:
- Complete route organizer interface with mock data
- Functional menu system and navigation
- Route list display with mock routes
- Search interface mockups for all search types
- Proper menu hierarchy (Main → Search submenu)

**Pending Features** - Backend functionality to be implemented:
- Actual route file parsing and storage
- Real search and filtering algorithms
- Folder management system
- Integration with Garmin navigation API
- Route metadata extraction from .fit/.gpx/.tcx files

## Development Notes

- Built with MonkeyC for Garmin Connect IQ platform
- Uses proper type annotations for strict compilation
- Follows Garmin Connect IQ best practices
- Fully tested UI in Connect IQ simulator
- Widget type compatible with Edge devices

## Version

- **Version**: 1.0.0 (UI Complete)
- **Min SDK**: 5.1.0
- **Language**: English

## License

This project is a route management application for Garmin Connect IQ widgets.
