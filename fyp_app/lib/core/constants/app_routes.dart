class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String introSlides = '/intro-slides';
  static const String roleSelection = '/role-selection';
  static const String permissions = '/permissions';

  // Auth
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';

  // Main navigation tabs
  static const String chats = '/chats';
  static const String conversation = '/conversation';
  static const String newChat = '/new-chat';
  static const String userDiscovery = '/user-discovery';

  // Calling
  static const String calls = '/calls';
  static const String incomingCall = '/calls/incoming';
  static const String outgoingCall = '/calls/outgoing';
  static const String videoCall = '/calls/video';

  // Sound Alerts
  static const String soundAlerts = '/sound-alerts';
  static const String dangerAlert = '/sound-alerts/danger';
  static const String alertHistory = '/sound-alerts/history';

  // Profile / Me
  static const String me = '/me';
  static const String editProfile = '/me/edit';
  static const String notificationsSettings = '/me/notifications';
  static const String privacySecurity = '/me/privacy';
  static const String textDisplay = '/me/text-display';

  // Features
  static const String voiceTranscript = '/voice-transcript';
  static const String signRecognition = '/sign-recognition';
  static const String customSigns = '/custom-signs';
  static const String teachSign = '/custom-signs/teach';
  static const String translation = '/translation';
  static const String faceToFace = '/face-to-face';
  static const String help = '/help';
}
