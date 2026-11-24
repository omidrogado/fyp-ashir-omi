import 'package:flutter/services.dart';

class CameraService {
  static const MethodChannel _channel = MethodChannel('com.lafzio.app/camera');

  Future<bool> initializeCamera() async {
    try {
      return await _channel.invokeMethod<bool>('initializeCamera') ?? false;
    } on PlatformException {
      return false;
    }
  }

  Future<void> releaseCamera() async {
    try {
      await _channel.invokeMethod('releaseCamera');
    } on PlatformException {
      // Ignore platform error on cleanup
    }
  }
}
