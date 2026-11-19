import 'package:flutter/services.dart';

/// Dart bridge to native Android YAMNet danger-sound classification.
class YamnetChannel {
  static const MethodChannel _methodChannel = MethodChannel('com.lafzio.app/yamnet');
  static const EventChannel _eventChannel = EventChannel('com.lafzio.app/yamnet_alerts');

  /// Start background danger sound listener (sirens, smoke alarms, honks, glass break).
  static Future<bool> startListening() async {
    try {
      final bool success = await _methodChannel.invokeMethod<bool>('startListening') ?? false;
      return success;
    } on PlatformException {
      return false;
    }
  }

  /// Stop danger sound listener.
  static Future<void> stopListening() async {
    await _methodChannel.invokeMethod('stopListening');
  }

  /// Stream of classified danger sound events.
  static Stream<dynamic> get alertStream {
    return _eventChannel.receiveBroadcastStream();
  }
}
