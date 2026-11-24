class CallRecord {
  final String id;
  final String peerName;
  final DateTime timestamp;
  final int durationSeconds;
  final bool isIncoming;
  final bool isMissed;

  const CallRecord({
    required this.id,
    required this.peerName,
    required this.timestamp,
    required this.durationSeconds,
    required this.isIncoming,
    this.isMissed = false,
  });
}
