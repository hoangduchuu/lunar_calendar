import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:lunar_calendar/services/notification/notification_service.dart';
import 'package:lunar_calendar/themes/dimens.dart';
import 'package:lunar_calendar/widgets/table_calendar_lib_custom/calendar_widget.dart';
import 'package:lunar_calendar/widgets/day_entertainment_info/day_entertainment_info.dart';
import 'package:lunar_calendar/widgets/day_info/solar_day_info.dart';
import 'package:lunar_calendar/widgets/today_icon/today_icon.dart';

import '../l10n/app_localizations.dart';
import '../table_calendar_lib/shared/utils.dart';
import '../themes/colors/light_colors.dart';
import '../widgets/card_widget.dart';
import '../widgets/day_event_info/day_event_info.dart';
import '../widgets/day_info/lunar_day_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _startCalendarDate = DateTime.utc(1900, 1, 1);
  final DateTime _endCalendarDate = DateTime.utc(2100, 12, 31);
  final DateTime _today = DateTime.now();

  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final ScrollController _scrollController = ScrollController();
  final PanelController _panelController = PanelController();

  void _onTodayPress() {
    setState(() {
      _selectedDay = DateTime.now();
    });
  }

  Future<void> _showDatePickerDialog(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDay,
        firstDate: _startCalendarDate,
        lastDate: _endCalendarDate);

    if (picked != null) {
      setState(() {
        _selectedDay = picked;
      });
    }
  }


  void _onSelectedDateChange(DateTime selectedDate) {
    setState(() {
      _selectedDay = selectedDate;
    });
  }

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  @override
  void initState() {
    super.initState();
    NotificationService().isAndroidPermissionGranted();
    NotificationService().requestPermissions();

    // Initialize notification after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService().initNotification(context);
    });
  }

  Widget _buildSlidingPanel() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(Dimens.smallPadding),
              child: Column(children: [
                CardWidget(
                  bgColor: ColorConstants.backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SolarDayInfo(solarDay: _selectedDay),
                      LunarDayInfo(lunarDay: _selectedDay),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.smallPadding),
                CardWidget(
                  child: Row(
                    children: [
                      Expanded(child: DayEventInfo(day: _selectedDay)),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.smallPadding),
                CardWidget(
                  minHeight: 200,
                  child: Row(
                    children: [
                      Expanded(child: DayEntertainmentInfo(day: _selectedDay)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyHomeScreen() {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = screenHeight - appBarHeight - statusBarHeight;

    return Container(
      constraints: const BoxConstraints(maxWidth: 700),
      color: ColorConstants.backgroundColor,
      child: SlidingUpPanel(
        controller: _panelController,
        minHeight: availableHeight * 0.5, // 50% of screen (half-half)
        maxHeight: availableHeight * 0.95, // 95% of screen (almost full)
        defaultPanelState: PanelState.CLOSED, // Start at minHeight (50%)
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        panel: _buildSlidingPanel(),
        body: Padding(
          padding: const EdgeInsets.all(Dimens.smallPadding),
          child: CardWidget(
            child: CalendarWidget(
              today: _selectedDay,
              startCalendarDate: _startCalendarDate,
              endCalendarDate: _endCalendarDate,
              onSelectedDayChange: _onSelectedDateChange,
              calendarFormat: _calendarFormat,
              onFormatChanged: _onFormatChanged,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.homeTitle),
        actions: [
          IconButton(
            icon: TodayIcon(date: _today),
            tooltip: localizations.todayActionDescription,
            onPressed: () {
              _onTodayPress();
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_month),
            tooltip: localizations.chooseDate,
            onPressed: () {
              _showDatePickerDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: localizations.settingActionDescription,
            onPressed: () async {
              // Navigator.pushNamed(context, router.settingScreen);

              // NotificationService().showNotification(id: 0, title: 'Title', body: 'Body');
              // NotificationService().zonedScheduleNotification();

              // if (kDebugMode) {
                // print(ScheduleEvent().nearestEventDay().toString());
                // NotificationService().zonedScheduleNotification(
                //     context, ScheduleEvent().nearestEventDay());
              // }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: !kIsWeb
            ? _bodyHomeScreen()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bodyHomeScreen(),
                ],
              ),
      ),
    );
  }
}