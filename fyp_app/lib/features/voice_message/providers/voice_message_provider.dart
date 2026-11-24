import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/voice_recorder_service.dart';

final voiceRecorderProvider = Provider((ref) => VoiceRecorderService());
