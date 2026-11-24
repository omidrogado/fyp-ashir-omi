import 'package:flutter/services.dart';

class AudioInputService {
  static const MethodChannel _channel = MethodChannel('com.lafzio.app/audio_input');
  static const EventChannel _streamChannel = EventChannel('com.lafzio.app/audio_stream');

  Future<bool> startMicrophoneStream() async {
    try {
      final bool started = await _channel.invokeMethod<bool>('startMicrophoneStream') ?? false;
      return started;
    } on PlatformException {
      return false;
    }
  }

  Future<void> stopMicrophoneStream() async {
    try {
      await _channel.invokeMethod('stopMicrophoneStream');
    } on PlatformException {
      // Ignore platform error on cleanup
    }
  }

  Stream<dynamic> get audioStream {
    return _streamChannel.receiveBroadcastStream();
  }
}
