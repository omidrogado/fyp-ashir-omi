import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isSecondary;
  final EdgeInsetsGeometry padding;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isSecondary = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = isDark ? AppColors.darkAccent : AppColors.lightAccent;
    final onAccent = isDark ? AppColors.darkOnAccent : AppColors.lightOnAccent;

    return Material(
      color: isSecondary ? accent.withValues(alpha: 0.14) : accent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: padding,
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: isSecondary ? accent : onAccent,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
