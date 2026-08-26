import 'package:flutter/material.dart';

import '../screens/history_screen.dart';
import '../screens/home_screens.dart';
import '../screens/ocr_screen.dart';
import '../screens/result_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const home = '/';
  static const ocr = '/ocr';
  static const history = '/history';
  static const settings = '/settings';

  static Map<String, WidgetBuilder> get routes => {
    home: (_) => HomeScreen(),
    ocr: (_) => const OCRScreen(),
    history: (_) => const HistoryScreen(),
    settings: (_) => const SettingsScreen(),
  };
}