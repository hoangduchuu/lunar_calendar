# Style and Conventions

- Lints: Inherits `package:flutter_lints/flutter.yaml` via `analysis_options.yaml`.
- General: Prefer Flutter/Dart idioms; follow naming conventions (UpperCamelCase for types, lowerCamelCase for members, ALL_CAPS for immutable constants).
- Internationalization: Strings should come from `AppLocalizations` (generated from ARB under `lib/l10n`).
- Routing: Use route constants from `lib/router.dart`.
- Theming: Centralize theme changes in `ThemeData` (currently in `main.dart`) or `lib/themes/` when expanded.
- Assets: Declare new assets in `pubspec.yaml` under `flutter.assets`.
- Notifications: Use `NotificationService` for any scheduling and timezone setup.
- Data: Interact with events through the helpers/models in `lib/data/event/`.
- Testing: Place tests under `test/` and prefer widget tests where possible.