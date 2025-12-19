import 'package:riverpod/riverpod.dart';

import '../../../models/user.dart';
import '../../providers/user_provider/user_provider.dart';

abstract class AuthRepository {
  Future<User?> login({required String email, required String password});

  Future<void> register({required User user});

  Future<void> updatePassword({required String email, required String newPassword});

  Future<void> sendEmailConfirmation({required String email});

  Future<bool> sendVerificationCode({required String email});

  Future<bool> verifyOtp({required String otp});

  void logout();
}

class MockAuthRepository extends AuthRepository {
  final List<User> allUsers;

  MockAuthRepository({required this.allUsers});

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      for (var user in allUsers) {
        if (user.email == email && user.password == password) {
          return user;
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> register({required User user}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      allUsers.add(user);
      print(user);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> sendEmailConfirmation({required String email}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> updatePassword({required String email, required String newPassword}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      for (var idx = 0; idx <= allUsers.length; idx++) {
        if (allUsers[idx].email == email) {
          allUsers[idx] = allUsers[idx].copyWith(password: newPassword);
          return;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> sendVerificationCode({required String email}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      for (var user in allUsers) {
        if (user.email == email) {
          return true;
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> verifyOtp({required String otp}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (otp == '12345') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void logout() {}
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final allUsers = ref.watch(userProvider);
  return MockAuthRepository(allUsers: allUsers);
});
