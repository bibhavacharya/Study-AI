import 'package:flutter/material.dart';

import 'route/app_routes.dart';
import 'theme/app_theme.dart';

class StudyAIApp extends StatelessWidget {
  const StudyAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study AI',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}