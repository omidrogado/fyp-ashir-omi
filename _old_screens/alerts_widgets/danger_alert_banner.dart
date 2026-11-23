import 'package:flutter/material.dart';
import '../../../../../core/theme/app_theme.dart';

/// Full-screen overlay banner shown when YAMNet detects a danger sound.
class DangerAlertBanner extends StatelessWidget {
  final String alertLabel;
  final VoidCallback onDismiss;

  const DangerAlertBanner({
    super.key,
    required this.alertLabel,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: const Color(0xEEE5442C),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 48),
              const SizedBox(height: 12),
              Text(
                alertLabel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFFE5442C)),
                onPressed: onDismiss,
                child: const Text('Dismiss'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
