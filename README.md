# Moon Manifest

A manifestation practice app synchronized to the lunar cycle. Set intentions at the new moon, express gratitude at the full moon, and reflect during the waxing and waning phases.

## Features

- **New Moon**: Set up to 7 intentions for the lunar cycle
- **Waxing Phase**: Focus on your intentions with breathing exercises
- **Full Moon**: Express gratitude through text or voice input
- **Waning Phase**: Reflect and release with daily wisdom quotes
- **Cycle History**: Review past cycles and track your practice
- **iOS Widget**: Live moon phase display on your home screen
- **Notifications**: Configurable reminders throughout the day
- **Privacy-first**: All data stored locally with AES-256 encrypted export

## Tech Stack

- Flutter (iOS & Android)
- Riverpod for state management
- GoRouter for navigation
- Jean Meeus algorithm for accurate moon phase calculation
- WidgetKit (iOS home screen widget)

## Getting Started

```bash
flutter pub get
flutter run
```

## Building for Release

### Android
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```
