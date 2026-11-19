import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Glassmorphism accent button adhering to Lafzio UI principles.
class GlassButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isPrimary;

  const GlassButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 14.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: isPrimary ? colors.accent : colors.accentSoft,
          borderRadius: BorderRadius.circular(borderRadius),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            child: Padding(
              padding: padding,
              child: Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: isPrimary ? colors.onAccent : colors.accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
