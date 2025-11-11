# Suggested Commands

## Setup
- flutter pub get

## Run
- flutter run -d chrome      # Web
- flutter run -d ios         # iOS (requires Xcode setup)
- flutter run -d android     # Android (requires emulator/device)

## Build
- flutter build web
- flutter build apk          # Android
- flutter build ios          # iOS (archive via Xcode if needed)
- flutter build macos
- flutter build windows
- flutter build linux

## Quality
- flutter analyze            # Static analysis per flutter_lints
- dart format .              # Format Dart code
- flutter test               # Run tests

## Dependencies
- flutter pub outdated
- flutter pub upgrade --major-versions

## Localization
- flutter gen-l10n           # Generate localization (reads ARB and I10n.yaml)

## Deployment (Web via Firebase Hosting)
- flutter build web
- firebase login             # One-time auth (requires firebase-tools)
- firebase deploy            # From hosting target directory if configured