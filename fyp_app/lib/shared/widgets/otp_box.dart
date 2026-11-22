import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/core/theme/app_typography.dart';

/// One digit cell of the 6-digit verify code (48x60, radius 14).
/// Presentational only: the input handling lives in the Phase 1 verify screen.
class OtpBox extends StatelessWidget {
  const OtpBox({
    super.key,
    this.digit,
    this.isFocused = false,
    this.glass = false,
    this.semanticLabel,
  });

  final String? digit;
  final bool isFocused;

  /// Glass fill used on the onboarding screens.
  final bool glass;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    final BorderRadius radius = BorderRadius.circular(14);

    final Border? border = isFocused
        ? Border.all(color: c.accent, width: 2)
        : glass
            ? Border.all(color: c.glassBorder, width: c.glassBorderWidth)
            : null;

    return Semantics(
      label: semanticLabel ?? (digit == null ? 'Empty digit' : 'Digit $digit'),
      excludeSemantics: true,
      child: Container(
        width: 48,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: glass ? null : c.card,
          gradient: glass
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[c.glassStart, c.glassEnd],
                )
              : null,
          border: border,
        ),
        child: Text(digit ?? '', style: AppTypography.otpDigit.copyWith(color: c.text)),
      ),
    );
  }
}