abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'A server error occurred. Please try again.']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failed. Please verify credentials.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local database cache error.']);
}

class RecognitionFailure extends Failure {
  const RecognitionFailure([super.message = 'Sign recognition failed. Check lighting.']);
}

class SoundDetectionFailure extends Failure {
  const SoundDetectionFailure([super.message = 'Sound detection failed to initialize.']);
}
