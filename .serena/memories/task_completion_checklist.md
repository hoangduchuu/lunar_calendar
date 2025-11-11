# Task Completion Checklist

Before marking a task done:
- Code compiles and app runs on at least one target (e.g., web or device)
- `flutter analyze` shows no new warnings/errors
- `dart format .` applied (no diff)
- Tests updated/added and `flutter test` passes
- Localization strings added to ARB and generated via `flutter gen-l10n` if user-facing text changed
- Assets declared in `pubspec.yaml` if new images/fonts added
- Notification-related changes tested on a real device if applicable
- README updated if user-facing behavior or setup steps changed