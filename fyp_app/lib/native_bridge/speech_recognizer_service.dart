import 'package:flutter/services.dart';

class SpeechRecognizerService {
  static const MethodChannel _channel = MethodChannel('com.lafzio.app/speech_recognizer');
  static const EventChannel _eventChannel = EventChannel('com.lafzio.app/speech_results');

  Future<bool> startListening({String locale = 'ur-PK'}) async {
    try {
      return await _channel.invokeMethod<bool>('startListening', {'locale': locale}) ?? false;
    } on PlatformException {
      return false;
    }
  }

  Future<void> stopListening() async {
    try {
      await _channel.invokeMethod('stopListening');
    } on PlatformException {
      // Ignore platform error on stop
    }
  }

  Stream<dynamic> get resultsStream {
    return _eventChannel.receiveBroadcastStream();
  }
}
