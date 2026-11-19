import 'package:flutter/services.dart';

/// Dart bridge to native Android MediaPipe landmark detection.
class MediaPipeChannel {
  static const MethodChannel _methodChannel = MethodChannel('com.lafzio.app/mediapipe');
  static const EventChannel _eventChannel = EventChannel('com.lafzio.app/mediapipe_stream');

  /// Initialize native MediaPipe landmarker model.
  static Future<bool> initialize() async {
    try {
      final bool success = await _methodChannel.invokeMethod<bool>('initialize') ?? false;
      return success;
    } on PlatformException {
      return false;
    }
  }

  /// Start landmark detection from camera feed.
  static Future<void> startDetection() async {
    await _methodChannel.invokeMethod('startDetection');
  }

  /// Stop landmark detection.
  static Future<void> stopDetection() async {
    await _methodChannel.invokeMethod('stopDetection');
  }

  /// Stream of normalized landmark coordinates.
  static Stream<dynamic> get landmarkStream {
    return _eventChannel.receiveBroadcastStream();
  }
}
