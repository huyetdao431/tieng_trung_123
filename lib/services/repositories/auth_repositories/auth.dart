import 'package:tieng_trung_123/models/user.dart';

abstract class Auth {
  Future<bool> login(String email, String password);
  Future<bool> register(User user);
  Future<bool> sendRecoveryEmail(String email);
  Future<bool> verifyOtp(String otp);
  Future<bool> getOtp(String email);
  Future<bool> updatePassword(String email, String newPassword);
}
