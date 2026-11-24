import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../native_bridge/haptic_service.dart';

class DangerAlertScreen extends StatefulWidget {
  final String soundType;
  final double confidence;

  const DangerAlertScreen({
    super.key,
    required this.soundType,
    required this.confidence,
  });

  @override
  State<DangerAlertScreen> createState() => _DangerAlertScreenState();
}

class _DangerAlertScreenState extends State<DangerAlertScreen> {
  @override
  void initState() {
    super.initState();
    HapticService.triggerDangerSoundHaptic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dangerRed,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 96, color: Colors.white),
              const SizedBox(height: 24),
              const Text(
                'DANGER DETECTED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.soundType.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Confidence: ${(widget.confidence * 100).toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 48),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.dangerRed,
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('I am Safe (Dismiss)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
