import 'package:flutter/material.dart';

/// Application route definitions and navigation routes.
class AppRoutes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String phoneInput = '/phone-input';
  static const String otpVerify = '/otp-verify';
  static const String themeSelection = '/theme-selection';
  static const String userType = '/user-type';
  static const String profileSetup = '/profile-setup';
  static const String avatarSelection = '/avatar-selection';
  static const String permissions = '/permissions';
  static const String login = '/login';

  // Chat & Communication
  static const String chatList = '/chats';
  static const String conversation = '/conversation';
  static const String newChat = '/new-chat';
  static const String contactInfo = '/contact-info';

  // Recognition & Translation
  static const String signCamera = '/recognition/camera';
  static const String textToSign = '/translation/text-to-sign';
  static const String speechToSign = '/translation/speech-to-sign';

  // Custom Signs
  static const String customDictionary = '/custom-signs';
  static const String recordSign = '/custom-signs/record';
  static const String verifySign = '/custom-signs/verify';
  static const String signDetail = '/custom-signs/detail';

  // Calls
  static const String callHistory = '/calls';
  static const String incomingCall = '/calls/incoming';
  static const String outgoingCall = '/calls/outgoing';
  static const String activeCall = '/calls/active';

  // Other Features
  static const String avatarPreview = '/avatars/preview';
  static const String dangerAlertsLog = '/alerts';
  static const String faceToFace = '/face-to-face';
  static const String helpCenter = '/help';
  static const String submitComplaint = '/help/complaint';

  // Settings
  static const String settings = '/settings';
  static const String editProfile = '/settings/profile';
  static const String changeAvatar = '/settings/avatar';
  static const String languageSpeechSettings = '/settings/language-speech';
  static const String dangerDetectionSettings = '/settings/danger-detection';
}

/// Navigation and auth redirect coordinator.
class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Evaluates auth redirect rules based on session status.
  static String? redirect(BuildContext context, {required bool isAuthenticated, required bool isOnboardingComplete}) {
    if (!isAuthenticated) {
      return isOnboardingComplete ? AppRoutes.login : AppRoutes.splash;
    }
    return null;
  }
}
