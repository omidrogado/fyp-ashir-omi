class DangerDetector {
  bool isDangerSound(String label, double confidence) {
    return confidence > 0.65;
  }
}
