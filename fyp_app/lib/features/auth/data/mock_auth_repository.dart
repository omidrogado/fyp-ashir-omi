import 'dart:async';

import 'package:fyp_app/features/auth/domain/auth_repository.dart';
import 'package:fyp_app/features/auth/domain/auth_status.dart';

class MockAuthRepository implements AuthRepository {
  MockAuthRepository({AuthStatus initialStatus = AuthStatus.signedIn}) : _status = initialStatus;

  final StreamController<AuthStatus> _controller = StreamController<AuthStatus>.broadcast();
  AuthStatus _status;

  @override
  AuthStatus get currentStatus => _status;

  @override
  Stream<AuthStatus> get statusChanges => _controller.stream;

  /// Dev / test helper to simulate session changes.
  void setStatus(AuthStatus status) {
    _status = status;
    _controller.add(status);
  }

  @override
  Future<void> signOut() async => setStatus(AuthStatus.signedOut);

  void dispose() => _controller.close();
}