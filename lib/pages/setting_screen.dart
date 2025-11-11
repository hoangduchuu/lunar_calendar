import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunar_calendar/l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settingTitle),
      ),
      body: const SafeArea(
        child: Center(
            child: Text("Đang phát triển"),
        ),
      ),
    );
  }
}
