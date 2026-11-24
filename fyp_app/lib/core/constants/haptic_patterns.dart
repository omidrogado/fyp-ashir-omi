class HapticPatterns {
  // Danger sound detection: 3 high-intensity burst pulses
  static const List<int> dangerSoundPattern = [0, 400, 150, 400, 150, 600];
  
  // Incoming call repeating vibration
  static const List<int> incomingCallPattern = [0, 800, 400, 800, 400];
  
  // Ambiguous sign notice
  static const List<int> ambiguityNoticePattern = [0, 120, 80, 120];

  // Button tap feedback duration (milliseconds)
  static const int lightTapMs = 30;
}
