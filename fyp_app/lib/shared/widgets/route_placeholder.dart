import 'package:flutter/material.dart';
import 'package:fyp_app/core/theme/app_theme.dart';
import 'package:fyp_app/core/theme/app_typography.dart';

/// Temporary body for routes whose real screen arrives in a later phase.
/// Delete each usage as the real screen lands.
class RoutePlaceholder extends StatelessWidget {
  const RoutePlaceholder({
    super.key,
    required this.title,
    required this.note,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String note;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final AppColors c = context.colors;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(title, style: AppTypography.largeTitle.copyWith(color: c.text)),
                const SizedBox(height: 8),
                Text(
                  note,
                  textAlign: TextAlign.center,
                  style: AppTypography.subtext.copyWith(color: c.sec),
                ),
                if (actionLabel != null && onAction != null) ...<Widget>[
                  const SizedBox(height: 24),
                  FilledButton(onPressed: onAction, child: Text(actionLabel!)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}