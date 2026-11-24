import 'package:flutter_test/flutter_test.dart';
import 'package:fyp_app/core/constants/app_routes.dart';

void main() {
  group('AppRoutes', () {
    test('routes are defined correctly', () {
      expect(AppRoutes.splash, equals('/'));
      expect(AppRoutes.welcome, equals('/welcome'));
      expect(AppRoutes.chats, equals('/chats'));
      expect(AppRoutes.soundAlerts, equals('/sound-alerts'));
      expect(AppRoutes.me, equals('/me'));
    });
  });
}
