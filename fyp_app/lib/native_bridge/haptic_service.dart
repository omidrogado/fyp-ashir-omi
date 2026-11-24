import 'package:flutter/services.dart';
import '../core/constants/haptic_patterns.dart';

class HapticService {
  static const MethodChannel _channel = MethodChannel('com.lafzio.app/haptic');

  static Future<void> triggerDangerSoundHaptic() async {
    try {
      await _channel.invokeMethod('vibratePattern', {
        'pattern': HapticPatterns.dangerSoundPattern,
      });
    } on PlatformException {
      HapticFeedback.heavyImpact();
    }
  }

  static Future<void> triggerIncomingCallHaptic() async {
    try {
      await _channel.invokeMethod('vibratePattern', {
        'pattern': HapticPatterns.incomingCallPattern,
      });
    } on PlatformException {
      HapticFeedback.mediumImpact();
    }
  }

  static Future<void> lightTap() async {
    HapticFeedback.lightImpact();
  }
}
