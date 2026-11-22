import 'package:fyp_app/features/auth/domain/auth_status.dart';

abstract interface class AuthRepository {
  AuthStatus get currentStatus;
  Stream<AuthStatus> get statusChanges;
  Future<void> signOut();
}