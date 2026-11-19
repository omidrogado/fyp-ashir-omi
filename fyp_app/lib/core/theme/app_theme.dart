import 'package:flutter/material.dart';

/// Design tokens and semantic colors as specified in Design.md
class AppColors extends ThemeExtension<AppColors> {
  final Color bg;
  final Color bgGrouped;
  final Color text;
  final Color sec;
  final Color secFaint;
  final Color accent;
  final Color accentSoft;
  final Color onAccent;
  final Color outA;
  final Color outB;
  final Color bubbleIn;
  final Color card;
  final Color raised;
  final Color sep;
  final Color green;

  const AppColors({
    required this.bg,
    required this.bgGrouped,
    required this.text,
    required this.sec,
    required this.secFaint,
    required this.accent,
    required this.accentSoft,
    required this.onAccent,
    required this.outA,
    required this.outB,
    required this.bubbleIn,
    required this.card,
    required this.raised,
    required this.sep,
    required this.green,
  });

  static const light = AppColors(
    bg: Color(0xFFFFFFFF),
    bgGrouped: Color(0xFFF2F2F7),
    text: Color(0xFF000000),
    sec: Color(0x9E3C3C43), // rgba(60,60,67,.62)
    secFaint: Color(0x593C3C43), // rgba(60,60,67,.35)
    accent: Color(0xFF0A6CF5),
    accentSoft: Color(0x240A6CF5), // 14%
    onAccent: Color(0xFFFFFFFF),
    outA: Color(0xFF2F8BFF),
    outB: Color(0xFF0A6CF5),
    bubbleIn: Color(0xFFE9E9EB),
    card: Color(0xFFF2F2F7),
    raised: Color(0xFFE5E5EA),
    sep: Color(0x2E3C3C43), // rgba(60,60,67,.18)
    green: Color(0xFF1A8A3C),
  );

  static const dark = AppColors(
    bg: Color(0xFF171717),
    bgGrouped: Color(0xFF171717),
    text: Color(0xFFE8E8EC),
    sec: Color(0x9EEBEBF5), // rgba(235,235,245,.62)
    secFaint: Color(0x66EBEBF5), // rgba(235,235,245,.40)
    accent: Color(0xFF5AA9FF),
    accentSoft: Color(0x245AA9FF),
    onAccent: Color(0xFF14100A),
    outA: Color(0xFF7DBBFF),
    outB: Color(0xFF4A98F0),
    bubbleIn: Color(0xFF232326),
    card: Color(0xFF232326),
    raised: Color(0xFF303034),
    sep: Color(0x8C545458), // rgba(84,84,88,.55)
    green: Color(0xFF32D74B),
  );

  @override
  AppColors copyWith({
    Color? bg,
    Color? bgGrouped,
    Color? text,
    Color? sec,
    Color? secFaint,
    Color? accent,
    Color? accentSoft,
    Color? onAccent,
    Color? outA,
    Color? outB,
    Color? bubbleIn,
    Color? card,
    Color? raised,
    Color? sep,
    Color? green,
  }) {
    return AppColors(
      bg: bg ?? this.bg,
      bgGrouped: bgGrouped ?? this.bgGrouped,
      text: text ?? this.text,
      sec: sec ?? this.sec,
      secFaint: secFaint ?? this.secFaint,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      onAccent: onAccent ?? this.onAccent,
      outA: outA ?? this.outA,
      outB: outB ?? this.outB,
      bubbleIn: bubbleIn ?? this.bubbleIn,
      card: card ?? this.card,
      raised: raised ?? this.raised,
      sep: sep ?? this.sep,
      green: green ?? this.green,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      bgGrouped: Color.lerp(bgGrouped, other.bgGrouped, t)!,
      text: Color.lerp(text, other.text, t)!,
      sec: Color.lerp(sec, other.sec, t)!,
      secFaint: Color.lerp(secFaint, other.secFaint, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      outA: Color.lerp(outA, other.outA, t)!,
      outB: Color.lerp(outB, other.outB, t)!,
      bubbleIn: Color.lerp(bubbleIn, other.bubbleIn, t)!,
      card: Color.lerp(card, other.card, t)!,
      raised: Color.lerp(raised, other.raised, t)!,
      sep: Color.lerp(sep, other.sep, t)!,
      green: Color.lerp(green, other.green, t)!,
    );
  }
}

extension AppThemeExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>() ?? AppColors.light;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.light.bg,
      primaryColor: AppColors.light.accent,
      extensions: const <ThemeExtension<dynamic>>[AppColors.light],
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0A6CF5),
        surface: Color(0xFFF2F2F7),
        onSurface: Color(0xFF000000),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.dark.bg,
      primaryColor: AppColors.dark.accent,
      extensions: const <ThemeExtension<dynamic>>[AppColors.dark],
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF5AA9FF),
        surface: Color(0xFF232326),
        onSurface: Color(0xFFE8E8EC),
      ),
    );
  }
}
