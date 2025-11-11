// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeTitle => 'Home';

  @override
  String get settingTitle => 'Setting';

  @override
  String get todayActionDescription => 'Today';

  @override
  String get chooseDate => 'Choose date';

  @override
  String get settingActionDescription => 'Setting';

  @override
  String get monthCalendarFormat => 'Month';

  @override
  String get weekCalendarFormat => 'Week';

  @override
  String get eventTitle => 'Events';

  @override
  String get eventEmpty => '<<Empty>>';

  @override
  String get tet_am_lich => 'Tet';

  @override
  String get ram_thang_rieng => 'Full Moon in January';

  @override
  String get tet_duong_lich => 'New Year';

  @override
  String get quoc_khanh_vn => 'Vietnam\'s National Day';

  @override
  String event(String event) {
    String _temp0 = intl.Intl.selectLogic(
      event,
      {
        'ram_thang_rieng': 'Full Moon in January',
        'tet_am_lich': 'Tet',
        'tet_duong_lich': 'New Year',
        'other': '<<Empty>>',
      },
    );
    return '$_temp0';
  }
}
