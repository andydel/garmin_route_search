# GarminRouteOrgsaniser - Garmin Connect IQ Application

An application to run on 

## Features

- **Group in folders**: Allows user s to define folders to store routes in and group them
- **Search by length of route**: Understads how long the route is and allows search based on routes around that length
- **Search by amount of elevation**: How much climbing is involved - allows users to search based on climbing
- **Search by type of rides**: Allows search based on the type of ride such as ravel, Road or Mountain bike etc
- **Search by location**: Find something close to a given location by reading the route file and understanding the GPS coordingates
- **Launch a ride**: Starts the navigation featire in Garmin to start the given ride once selected

## Supported Devices

- Garmin Edge 540
- Garmin Edge 840

## Requirements

- **Garmin Connect IQ SDK**: Version 8.2.3 or later
- **Developer Key**: Needs to be provided
- **MonkeyC Compiler**: Included with Connect IQ SDK

## Building the App

### Compile for Edge 840:
```bash
export SDK_PATH="Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-8.2.3-2025-08-11-cac5b3b21"
"${SDK_PATH}/bin/monkeyc" -f monkey.jungle -d edge840 -o bin/TestGarmin.prg -y ~[location of key]
```

### Run in Simulator:
```bash
# Launch simulator
"${SDK_PATH}/bin/connectiq" &

# Load app into simulator
"${SDK_PATH}/bin/monkeydo" bin/TestGarmin.prg edge840
```

## File Structure

```
TestGarmin/
├── source/                    # MonkeyC source files
│   ├── MyConnectApp.mc       # Main application class
│   ├── MyConnectView.mc      # UI view and display logic
│   ├── MyConnectDelegate.mc  # Button input handling
│   └── MyConnectMenuDelegate.mc # Menu interaction handling
├── resources/                # Application resources
│   ├── drawables/           # Icons and images
│   ├── layouts/             # UI layouts
│   ├── menus/               # Menu definitions
│   └── strings/             # Localized strings
├── bin/                     # Compiled output
├── manifest.xml             # App metadata and permissions
└── monkey.jungle            # Build configuration
```

## Controls

- **START Button**: Open menu
- **SELECT Button**: Confirm selection (logs to console)
- **BACK Button**: Exit application or close menu

## Menu Options

1. **Start Activity**: Placeholder menu item
2. **View Stats**: Placeholder menu item
3. **Settings**: Placeholder menu item

## Permissions

- **Positioning**: Access to GPS location data
- **UserProfile**: Access to user profile information

## Development Notes

- Built with MonkeyC for Garmin Connect IQ platform
- Uses proper type annotations for strict compilation
- Follows Garmin Connect IQ best practices
- Tested and working in Connect IQ simulator

## Version

- **Version**: 1.0.0
- **Min SDK**: 5.1.0
- **Language**: English

## License

This project is a development example for Garmin Connect IQ widgets.
