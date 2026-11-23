import 'package:flutter_test/flutter_test.dart';
import 'package:fyp_app/core/router/app_routes.dart';
import 'package:fyp_app/core/router/auth_guard.dart';
import 'package:fyp_app/features/auth/domain/auth_status.dart';

void main() {
  group('resolveAuthRedirect', () {
    test('splash is always allowed', () {
      for (final AuthStatus status in AuthStatus.values) {
        expect(resolveAuthRedirect(status: status, location: AppRoutes.splash), isNull);
      }
    });

    test('signed out users are sent to onboarding from app tabs', () {
      expect(
        resolveAuthRedirect(status: AuthStatus.signedOut, location: AppRoutes.chats),
        AppRoutes.onboarding,
      );
    });

    test('signed out users may open onboarding and login', () {
      expect(resolveAuthRedirect(status: AuthStatus.signedOut, location: AppRoutes.onboarding), isNull);
      expect(resolveAuthRedirect(status: AuthStatus.signedOut, location: AppRoutes.login), isNull);
    });

    test('setup incomplete users stay in onboarding', () {
      expect(
        resolveAuthRedirect(status: AuthStatus.setupIncomplete, location: AppRoutes.me),
        AppRoutes.onboarding,
      );
      expect(
        resolveAuthRedirect(status: AuthStatus.setupIncomplete, location: '${AppRoutes.onboarding}/theme'),
        isNull,
      );
    });

    test('signed in users skip onboarding and login', () {
      expect(
        resolveAuthRedirect(status: AuthStatus.signedIn, location: AppRoutes.onboarding),
        AppRoutes.chats,
      );
      expect(
        resolveAuthRedirect(status: AuthStatus.signedIn, location: AppRoutes.login),
        AppRoutes.chats,
      );
      expect(resolveAuthRedirect(status: AuthStatus.signedIn, location: AppRoutes.signs), isNull);
    });
  });
}