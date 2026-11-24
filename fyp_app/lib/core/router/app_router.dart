import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_routes.dart';

// Screens
import '../../features/onboarding/screens/splash_screen.dart';
import '../../features/onboarding/screens/welcome_screen.dart';
import '../../features/onboarding/screens/intro_slides_screen.dart';
import '../../features/onboarding/screens/role_selection_screen.dart';
import '../../features/onboarding/screens/permissions_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/otp_screen.dart';
import '../../features/chat/screens/chats_list_screen.dart';
import '../../features/chat/screens/conversation_screen.dart';
import '../../features/chat/screens/new_chat_screen.dart';
import '../../features/chat/screens/user_discovery_screen.dart';
import '../../features/calling/screens/calls_history_screen.dart';
import '../../features/calling/screens/incoming_call_screen.dart';
import '../../features/calling/screens/outgoing_call_screen.dart';
import '../../features/calling/screens/video_call_screen.dart';
import '../../features/sound_alerts/screens/sound_alerts_screen.dart';
import '../../features/sound_alerts/screens/danger_alert_screen.dart';
import '../../features/sound_alerts/screens/alert_history_screen.dart';
import '../../features/profile/screens/me_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/notifications_settings_screen.dart';
import '../../features/profile/screens/privacy_security_screen.dart';
import '../../features/profile/screens/text_display_screen.dart';
import '../../features/sign_recognition/screens/sign_to_text_screen.dart';
import '../../features/custom_signs/screens/my_signs_screen.dart';
import '../../features/custom_signs/screens/teach_sign_screen.dart';
import '../../features/translation/screens/translate_screen.dart';
import '../../features/face_to_face/screens/face_to_face_screen.dart';
import '../../features/help/screens/help_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.welcome, builder: (context, state) => const WelcomeScreen()),
      GoRoute(path: AppRoutes.introSlides, builder: (context, state) => const IntroSlidesScreen()),
      GoRoute(path: AppRoutes.roleSelection, builder: (context, state) => const RoleSelectionScreen()),
      GoRoute(path: AppRoutes.permissions, builder: (context, state) => const PermissionsScreen()),
      GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, builder: (context, state) => const RegisterScreen()),
      GoRoute(path: AppRoutes.otp, builder: (context, state) => const OtpScreen()),

      // Chat
      GoRoute(path: AppRoutes.chats, builder: (context, state) => const ChatsListScreen()),
      GoRoute(path: AppRoutes.conversation, builder: (context, state) => const ConversationScreen()),
      GoRoute(path: AppRoutes.newChat, builder: (context, state) => const NewChatScreen()),
      GoRoute(path: AppRoutes.userDiscovery, builder: (context, state) => const UserDiscoveryScreen()),

      // Calling
      GoRoute(path: AppRoutes.calls, builder: (context, state) => const CallsHistoryScreen()),
      GoRoute(path: AppRoutes.incomingCall, builder: (context, state) => const IncomingCallScreen()),
      GoRoute(path: AppRoutes.outgoingCall, builder: (context, state) => const OutgoingCallScreen()),
      GoRoute(path: AppRoutes.videoCall, builder: (context, state) => const VideoCallScreen()),

      // Sound Alerts
      GoRoute(path: AppRoutes.soundAlerts, builder: (context, state) => const SoundAlertsScreen()),
      GoRoute(
        path: AppRoutes.dangerAlert,
        builder: (context, state) => const DangerAlertScreen(soundType: 'Emergency Siren', confidence: 0.92),
      ),
      GoRoute(path: AppRoutes.alertHistory, builder: (context, state) => const AlertHistoryScreen()),

      // Profile / Me
      GoRoute(path: AppRoutes.me, builder: (context, state) => const MeScreen()),
      GoRoute(path: AppRoutes.editProfile, builder: (context, state) => const EditProfileScreen()),
      GoRoute(path: AppRoutes.notificationsSettings, builder: (context, state) => const NotificationsSettingsScreen()),
      GoRoute(path: AppRoutes.privacySecurity, builder: (context, state) => const PrivacySecurityScreen()),
      GoRoute(path: AppRoutes.textDisplay, builder: (context, state) => const TextDisplayScreen()),

      // Other features
      GoRoute(path: AppRoutes.signRecognition, builder: (context, state) => const SignToTextScreen()),
      GoRoute(path: AppRoutes.customSigns, builder: (context, state) => const MySignsScreen()),
      GoRoute(path: AppRoutes.teachSign, builder: (context, state) => const TeachSignScreen()),
      GoRoute(path: AppRoutes.translation, builder: (context, state) => const TranslateScreen()),
      GoRoute(path: AppRoutes.faceToFace, builder: (context, state) => const FaceToFaceScreen()),
      GoRoute(path: AppRoutes.help, builder: (context, state) => const HelpScreen()),
    ],
  );
});
