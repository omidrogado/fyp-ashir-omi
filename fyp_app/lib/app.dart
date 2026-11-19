import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

class LafzioApp extends StatelessWidget {
  final ThemeMode themeMode;

  const LafzioApp({super.key, this.themeMode = ThemeMode.system});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lafzio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      // go_router setup (app_router.dart) will replace this once implemented
      initialRoute: '/',
      onGenerateRoute: (_) => null,
    );
  }
}
