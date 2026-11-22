import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Type scale from Design.md section 4. Styles carry no colour:
/// apply it at the call site, e.g. `AppTypography.body.copyWith(color: context.colors.text)`.
abstract final class AppTypography {
  static TextStyle _inter(
    double size,
    FontWeight weight, {
    double? height,
    double trackingEm = -0.011,
  }) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: size * trackingEm,
    );
  }

  static TextStyle get largeTitle => _inter(34, FontWeight.w700, height: 1.1, trackingEm: -0.03);
  static TextStyle get onboardingTitle => _inter(32, FontWeight.w700, height: 1.1, trackingEm: -0.03);
  static TextStyle get sectionTitle => _inter(20, FontWeight.w700);
  static TextStyle get body => _inter(16, FontWeight.w400);
  static TextStyle get bodyEmphasis => _inter(16, FontWeight.w600);
  static TextStyle get subtext => _inter(16, FontWeight.w400, height: 1.4);
  static TextStyle get chip => _inter(14, FontWeight.w600);
  static TextStyle get button => _inter(17, FontWeight.w600);
  static TextStyle get tab => _inter(10, FontWeight.w600);
  static TextStyle get otpDigit => _inter(26, FontWeight.w700);
}