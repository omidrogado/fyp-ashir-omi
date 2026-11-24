class PermissionHelper {
  static Future<bool> requestCameraPermission() async {
    // Platform permission handling logic
    return true;
  }

  static Future<bool> requestMicrophonePermission() async {
    return true;
  }

  static Future<bool> requestNotificationPermission() async {
    return true;
  }

  static Future<Map<String, bool>> requestAllOnboardingPermissions() async {
    return {
      'camera': await requestCameraPermission(),
      'microphone': await requestMicrophonePermission(),
      'notifications': await requestNotificationPermission(),
    };
  }
}
