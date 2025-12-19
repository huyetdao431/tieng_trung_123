import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/models/user.dart';

import '../../repositories/auth_repositories/auth_repository.dart';

sealed class AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthRequestOtp extends AuthState {
  final String email;
  AuthRequestOtp(this.email);
}

class AuthNotifier extends AsyncNotifier<AuthState> {
  @override
  Future<AuthState> build() async {
    await Future.delayed(Duration(seconds: 1));
    return AuthUnauthenticated();
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.login(email: email, password: password);
      return AuthAuthenticated(user!);
    });
  }

  Future<void> register({required User user}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.register(user: user);
      return AuthUnauthenticated();
    });
  }

  Future<void> updatePassword({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.updatePassword(email: email, newPassword: password);
      return AuthUnauthenticated();
    });
  }

  Future<void> sendEmailConfirmation({required String email}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.sendEmailConfirmation(email: email);
      return AuthUnauthenticated();
    });
  }

  Future<void> sendVerificationCode({required String email}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      await repo.sendVerificationCode(email: email);
      return AuthUnauthenticated();
    });
  }

  Future<void> verifyOtp({required String otp}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      final result = await repo.verifyOtp(otp: otp);
      return AuthUnauthenticated();
    });
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(authRepositoryProvider);
      repo.logout();
      return AuthUnauthenticated();
    });
  }
}

final authNotifierProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
