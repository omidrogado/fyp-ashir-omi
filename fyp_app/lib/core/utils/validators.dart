class Validators {
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number cannot be empty';
    }
    final cleanPhone = value.replaceAll(RegExp(r'[\s\-()]'), '');
    if (!RegExp(r'^\+?[0-9]{10,14}$').hasMatch(cleanPhone)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validateOtp(String? value, {int length = 6}) {
    if (value == null || value.trim().length != length) {
      return 'Enter a $length-digit code';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Code must contain digits only';
    }
    return null;
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }
}
