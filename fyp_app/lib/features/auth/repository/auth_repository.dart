class AuthRepository {
  Future<bool> sendOtp(String phone) async => true;
  Future<bool> verifyOtp(String phone, String otp) async => true;
}
