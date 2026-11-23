/// User-facing failures. `message` is short, warm and safe to show on screen.
sealed class Failure implements Exception {
  const Failure(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No connection. We will try again soon.']);
}

final class TranscriptionFailure extends Failure {
  const TranscriptionFailure([super.message = 'Could not read that voice message. Tap to retry.']);
}

final class ModuleFailure extends Failure {
  const ModuleFailure([super.message = 'Something stopped working. The rest of the app is fine.']);
}

final class AuthFailure extends Failure {
  const AuthFailure([super.message = 'We could not sign you in. Please try again.']);
}

final class PermissionFailure extends Failure {
  const PermissionFailure([super.message = 'Access is off. You can turn it on in Settings.']);
}