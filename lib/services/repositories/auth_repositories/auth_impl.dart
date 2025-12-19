import 'package:tieng_trung_123/models/user.dart';

import 'auth.dart';

class AuthImplements extends Auth {
  List<User> users = [
    User(id: '1', firstName: 'Hoang', lastName: 'Hieu', email: 'hieu123@gmail.com', password: 'hieu123456', phone: '0123456789'),
    User(id: '2', firstName: 'Nguyen', lastName: 'Hieu', email: 'hieu123@gmail.com', password: 'hieu123456', phone: '0123456789'),
  ];
  static String recoveryCode = '12345';

  @override
  Future<bool> sendRecoveryEmail(String email) async {
    await Future.delayed(Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<bool> updatePassword(String email, String newPassword) async {
    try {
      await Future.delayed(Duration(milliseconds: 200));
      for (var user in users) {
        if (user.email == email) {
          user = user.copyWith(password: newPassword);
          return true;
        }
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    try {
      await Future.delayed(Duration(milliseconds: 200));
      if (otp == recoveryCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      for (var user in users) {
        if (user.email == email && user.password == password) {
          return true;
        }
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> register(User user) async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      users.add(user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> getOtp(String email) async {
    try {
      await Future.delayed(Duration(milliseconds: 200));
      for (var user in users) {
        if (user.email == email) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
