# iOS Widget Extension - Manual Xcode Setup

The SwiftUI widget code and Dart service are ready, but the Widget Extension
target must be registered in the Xcode project. These steps cannot be automated
from the CLI.

## Steps

### 1. Add the Widget Extension target

1. Open `ios/Runner.xcworkspace` in Xcode.
2. File > New > Target > **Widget Extension**.
3. Product Name: `MoonPhaseWidget`
4. Uncheck "Include Configuration App Intent" (we use `StaticConfiguration`).
5. When prompted to activate the scheme, click **Activate**.
6. **Delete** the auto-generated Swift files that Xcode creates in the new
   `MoonPhaseWidget` folder (Xcode generates template files). Keep only the
   files already in `ios/MoonPhaseWidget/`:
   - `MoonPhaseWidget.swift`
   - `Info.plist`
   - `MoonPhaseWidget.entitlements`

### 2. Configure App Groups

Both the main **Runner** target and the **MoonPhaseWidget** target must share
the same App Group.

1. Select the **Runner** target > Signing & Capabilities > + Capability > **App Groups**.
2. Add: `group.com.moonmanifest.moonManifest`
3. Select the **MoonPhaseWidget** target > Signing & Capabilities > + Capability > **App Groups**.
4. Add: `group.com.moonmanifest.moonManifest`

### 3. Set the entitlements file

For the MoonPhaseWidget target, under Build Settings > Code Signing Entitlements,
set the path to `MoonPhaseWidget/MoonPhaseWidget.entitlements`.

### 4. Set the bundle identifier

Set the MoonPhaseWidget bundle identifier to:
`com.moonmanifest.moonManifest.MoonPhaseWidget`

### 5. Set deployment target

Set the MoonPhaseWidget minimum deployment target to iOS 17.0 (or match the
main app target).

### 6. Build and run

Build the project. The widget should appear in the iOS widget picker under
"Moon Phase".

## How it works

- The Flutter app writes moon phase data to shared `UserDefaults` via the
  `home_widget` package (see `lib/core/widget/widget_service.dart`).
- The native SwiftUI widget reads from the same shared `UserDefaults` container
  using the App Group `group.com.moonmanifest.moonManifest`.
- Data is refreshed every time `LunarStateNotifier._computeState()` runs
  (every 60 seconds) and the widget timeline refreshes every 30 minutes.
