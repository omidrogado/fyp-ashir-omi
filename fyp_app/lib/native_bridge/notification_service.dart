import 'package:flutter/services.dart';

class NotificationService {
  static const MethodChannel _channel = MethodChannel('com.lafzio.app/notifications');

  static Future<void> showDangerAlertNotification({
    required String title,
    required String body,
  }) async {
    try {
      await _channel.invokeMethod('showHighPriorityNotification', {
        'title': title,
        'body': body,
        'channel': 'danger_alerts',
      });
    } on PlatformException {
      // Ignore notification platform error
    }
  }

  static Future<void> showCallNotification({
    required String callerName,
  }) async {
    try {
      await _channel.invokeMethod('showIncomingCallNotification', {
        'callerName': callerName,
      });
    } on PlatformException {
      // Ignore notification platform error
    }
  }
}
