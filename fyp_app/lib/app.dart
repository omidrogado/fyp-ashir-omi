import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_app/core/router/app_router.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/features/settings/application/theme_providers.dart';

class LafzioApp extends ConsumerWidget {
  const LafzioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final ThemeMode themeMode = ref.watch(themeModeProvider);

    // Design.md section 10: theme cross-fade ~0.35 s, off when reduced motion is on.
    final bool reduceMotion =
        WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.disableAnimations;

    return MaterialApp.router(
      title: 'Lafzio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      themeAnimationDuration:
          reduceMotion ? Duration.zero : const Duration(milliseconds: 350),
      routerConfig: router,
    );
  }
}