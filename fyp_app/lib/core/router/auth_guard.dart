import 'package:fyp_app/core/router/app_routes.dart';
import 'package:fyp_app/features/auth/domain/auth_status.dart';

/// Pure redirect rule so it can be unit tested without a router.
/// Returns the path to redirect to, or null to allow the current location.
///
/// The splash route always passes: it decides static (0a) vs animated (0b) itself.
String? resolveAuthRedirect({
  required AuthStatus status,
  required String location,
}) {
  if (location == AppRoutes.splash) return null;

  final bool inOnboarding = location.startsWith(AppRoutes.onboarding);
  final bool inLogin = location == AppRoutes.login;

  return switch (status) {
    AuthStatus.signedOut => (inOnboarding || inLogin) ? null : AppRoutes.onboarding,
    AuthStatus.setupIncomplete => inOnboarding ? null : AppRoutes.onboarding,
    AuthStatus.signedIn => (inOnboarding || inLogin) ? AppRoutes.chats : null,
  };
}