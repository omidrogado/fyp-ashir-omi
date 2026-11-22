import 'dart:ui' show lerpDouble;

import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_typography.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens from Design.md section 3. Read with `context.colors`.
/// Never hard-code a colour in a screen or widget.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.bg,
    required this.bgGrouped,
    required this.text,
    required this.sec,
    required this.secFaint,
    required this.accent,
    required this.accentSoft,
    required this.accentGlow,
    required this.onAccent,
    required this.outA,
    required this.outB,
    required this.bubbleIn,
    required this.groupBg,
    required this.card,
    required this.raised,
    required this.sep,
    required this.hairline,
    required this.searchBg,
    required this.glassStart,
    required this.glassEnd,
    required this.glassBorder,
    required this.glassBorderWidth,
    required this.glassShadow,
    required this.navActiveBg,
    required this.segActive,
    required this.ringTrack,
    required this.green,
    required this.danger,
    required this.onDanger,
    required this.stage,
    required this.mediaA,
    required this.mediaB,
    required this.thumbA,
    required this.thumbB,
    required this.torso,
    required this.avGoldA,
    required this.avGoldB,
    required this.avatarText,
    required this.tileEar,
    required this.tileBell,
    required this.tileLock,
    required this.tileType,
    required this.tileHelp,
  });

  final Color bg;
  final Color bgGrouped;
  final Color text;
  final Color sec;
  final Color secFaint;
  final Color accent;
  final Color accentSoft;
  final Color accentGlow;
  final Color onAccent;
  final Color outA;
  final Color outB;
  final Color bubbleIn;
  final Color groupBg;
  final Color card;
  final Color raised;
  final Color sep;
  final Color hairline;
  final Color searchBg;
  final Color glassStart;
  final Color glassEnd;
  final Color glassBorder;
  final double glassBorderWidth;
  final List<BoxShadow> glassShadow;
  final Color navActiveBg;
  final Color segActive;
  final Color ringTrack;
  final Color green;
  final Color danger;
  final Color onDanger;
  final Color stage;
  final Color mediaA;
  final Color mediaB;
  final Color thumbA;
  final Color thumbB;
  final Color torso;
  final Color avGoldA;
  final Color avGoldB;
  final Color avatarText;
  final Color tileEar;
  final Color tileBell;
  final Color tileLock;
  final Color tileType;
  final Color tileHelp;

  static const AppColors light = AppColors(
    bg: Color(0xFFFFFFFF),
    bgGrouped: Color(0xFFF2F2F7),
    text: Color(0xFF000000),
    sec: Color(0x9E3C3C43),
    secFaint: Color(0x593C3C43),
    accent: Color(0xFF0A6CF5),
    accentSoft: Color(0x240A6CF5),
    accentGlow: Color(0x800A6CF5),
    onAccent: Color(0xFFFFFFFF),
    outA: Color(0xFF2F8BFF),
    outB: Color(0xFF0A6CF5),
    bubbleIn: Color(0xFFE9E9EB),
    groupBg: Color(0xFFFFFFFF),
    card: Color(0xFFF2F2F7),
    raised: Color(0xFFE5E5EA),
    sep: Color(0x2E3C3C43),
    hairline: Color(0x243C3C43),
    searchBg: Color(0x1F767680),
    glassStart: Color(0xB8FFFFFF),
    glassEnd: Color(0x6BE0ECFF),
    glassBorder: Color(0x290A6CF5),
    glassBorderWidth: 1,
    glassShadow: <BoxShadow>[
      BoxShadow(color: Color(0x2B0A3CA0), offset: Offset(0, 10), blurRadius: 30),
    ],
    navActiveBg: Color(0x1F0A6CF5),
    segActive: Color(0xFFFFFFFF),
    ringTrack: Color(0x2E3C3C43),
    green: Color(0xFF1A8A3C),
    danger: Color(0xFFE5342A),
    onDanger: Color(0xFFFFFFFF),
    stage: Color(0xFFE6F0FF),
    mediaA: Color(0xFFEAF2FF),
    mediaB: Color(0xFFCFE1FF),
    thumbA: Color(0xFFEEF2F8),
    thumbB: Color(0xFFDCE4F0),
    torso: Color(0xFF0A6CF5),
    avGoldA: Color(0xFFF7D37E),
    avGoldB: Color(0xFFBF8C2E),
    avatarText: Color(0xFF1A1A1C),
    tileEar: Color(0xFF1D9A8A),
    tileBell: Color(0xFFE5442C),
    tileLock: Color(0xFF4C6EA8),
    tileType: Color(0xFF6E6E73),
    tileHelp: Color(0xFF1A8A3C),
  );

  static const AppColors dark = AppColors(
    bg: Color(0xFF171717),
    bgGrouped: Color(0xFF171717),
    text: Color(0xFFE8E8EC),
    sec: Color(0x9EEBEBF5),
    secFaint: Color(0x66EBEBF5),
    accent: Color(0xFF5AA9FF),
    accentSoft: Color(0x245AA9FF),
    accentGlow: Color(0x805AA9FF),
    onAccent: Color(0xFF14100A),
    outA: Color(0xFF7DBBFF),
    outB: Color(0xFF4A98F0),
    bubbleIn: Color(0xFF232326),
    groupBg: Color(0xFF232326),
    card: Color(0xFF232326),
    raised: Color(0xFF303034),
    sep: Color(0x8C545458),
    hairline: Color(0x33FFFFFF),
    searchBg: Color(0x3D767680),
    glassStart: Color(0x2BFFFFFF),
    glassEnd: Color(0x0DFFFFFF),
    glassBorder: Color(0x33FFFFFF),
    glassBorderWidth: 0.5,
    glassShadow: <BoxShadow>[
      BoxShadow(color: Color(0x80000000), offset: Offset(0, 10), blurRadius: 30),
    ],
    navActiveBg: Color(0x21FFFFFF),
    segActive: Color(0x2EFFFFFF),
    ringTrack: Color(0x40FFFFFF),
    green: Color(0xFF32D74B),
    danger: Color(0xFFE5342A),
    onDanger: Color(0xFFFFFFFF),
    stage: Color(0xFF1E2634),
    mediaA: Color(0xFF2A2A2E),
    mediaB: Color(0xFF0C0C0E),
    thumbA: Color(0xFF34343A),
    thumbB: Color(0xFF151517),
    torso: Color(0xFF303034),
    avGoldA: Color(0xFFE4DECF),
    avGoldB: Color(0xFF958D7C),
    avatarText: Color(0xFF14100A),
    tileEar: Color(0xFF6FD6C4),
    tileBell: Color(0xFFFF9C7A),
    tileLock: Color(0xFF8DB8FF),
    tileType: Color(0xFFC7C7CC),
    tileHelp: Color(0xFFE4DECF),
  );

  /// The two palettes are fixed const sets, so there is nothing to override.
  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      bg: c(bg, other.bg),
      bgGrouped: c(bgGrouped, other.bgGrouped),
      text: c(text, other.text),
      sec: c(sec, other.sec),
      secFaint: c(secFaint, other.secFaint),
      accent: c(accent, other.accent),
      accentSoft: c(accentSoft, other.accentSoft),
      accentGlow: c(accentGlow, other.accentGlow),
      onAccent: c(onAccent, other.onAccent),
      outA: c(outA, other.outA),
      outB: c(outB, other.outB),
      bubbleIn: c(bubbleIn, other.bubbleIn),
      groupBg: c(groupBg, other.groupBg),
      card: c(card, other.card),
      raised: c(raised, other.raised),
      sep: c(sep, other.sep),
      hairline: c(hairline, other.hairline),
      searchBg: c(searchBg, other.searchBg),
      glassStart: c(glassStart, other.glassStart),
      glassEnd: c(glassEnd, other.glassEnd),
      glassBorder: c(glassBorder, other.glassBorder),
      glassBorderWidth:
          lerpDouble(glassBorderWidth, other.glassBorderWidth, t) ?? glassBorderWidth,
      glassShadow: BoxShadow.lerpList(glassShadow, other.glassShadow, t) ?? glassShadow,
      navActiveBg: c(navActiveBg, other.navActiveBg),
      segActive: c(segActive, other.segActive),
      ringTrack: c(ringTrack, other.ringTrack),
      green: c(green, other.green),
      danger: c(danger, other.danger),
      onDanger: c(onDanger, other.onDanger),
      stage: c(stage, other.stage),
      mediaA: c(mediaA, other.mediaA),
      mediaB: c(mediaB, other.mediaB),
      thumbA: c(thumbA, other.thumbA),
      thumbB: c(thumbB, other.thumbB),
      torso: c(torso, other.torso),
      avGoldA: c(avGoldA, other.avGoldA),
      avGoldB: c(avGoldB, other.avGoldB),
      avatarText: c(avatarText, other.avatarText),
      tileEar: c(tileEar, other.tileEar),
      tileBell: c(tileBell, other.tileBell),
      tileLock: c(tileLock, other.tileLock),
      tileType: c(tileType, other.tileType),
      tileHelp: c(tileHelp, other.tileHelp),
    );
  }
}

extension AppColorsX on BuildContext {
  /// Design tokens for the current theme. Falls back to the matching palette
  /// if the extension is missing (for example in an unthemed test).
  AppColors get colors {
    final ThemeData theme = Theme.of(this);
    return theme.extension<AppColors>() ??
        (theme.brightness == Brightness.dark ? AppColors.dark : AppColors.light);
  }
}

abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);
  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final ThemeData base = ThemeData(brightness: brightness, useMaterial3: true);
    final ColorScheme scheme = ColorScheme(
      brightness: brightness,
      primary: c.accent,
      onPrimary: c.onAccent,
      secondary: c.accent,
      onSecondary: c.onAccent,
      error: c.danger,
      onError: c.onDanger,
      surface: c.bg,
      onSurface: c.text,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: c.bg,
      canvasColor: c.bg,
      dividerColor: c.sep,
      textTheme: GoogleFonts.interTextTheme(base.textTheme)
          .apply(bodyColor: c.text, displayColor: c.text),
      splashFactory: NoSplash.splashFactory,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: c.onAccent,
          minimumSize: const Size(88, 54),
          shape: const StadiumBorder(),
          textStyle: AppTypography.button,
        ),
      ),
      extensions: <AppColors>[c],
    );
  }
}