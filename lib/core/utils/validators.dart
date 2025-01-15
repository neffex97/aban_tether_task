// lib/core/utils/validators.dart
class Validators {
  static bool isValidIranianPhoneNumber(String phoneNumber) {
    final regex = RegExp(r'^(\+98|0)?9\d{9}$');
    return regex.hasMatch(phoneNumber);
  }
}
