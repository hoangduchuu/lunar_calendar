# Codebase Structure (high-level)

- `lib/main.dart`: App entrypoint. Initializes time zone for notifications, sets up `MaterialApp`, theme, locales, and routes.
- `lib/router.dart`: Route name constants (`/`, `/setting`).
- `lib/pages/`: Screens (`home_screen.dart`, `setting_screen.dart`).
- `lib/widgets/`: UI components (e.g., calendar customizations, info panels, icons).
- `lib/table_calendar_lib/`: Embedded calendar library and shared utils; customization styles and widgets.
- `lib/viet_calendar/`: Core logic for Vietnamese lunar calendar and Can Chi calculations.
- `lib/services/notification/`: Notification scheduling and timezone configuration.
- `lib/data/`: Models and persistence (events via sqflite, author/poem data, defaults).
- `lib/l10n/`: Localization ARB files and generated localization helpers.
- `lib/themes/`: Theme data, color palettes, dimensions.
- `lib/utils/`: Utility helpers (calendar page utils, event utils, platform utils).
- `lib/assets/images/`: Background images referenced in `pubspec.yaml` assets section.
- `test/`: Widget test scaffold.
- Platform directories: `android/`, `ios/`, `macos/`, `windows/`, `linux/`, `web/`.