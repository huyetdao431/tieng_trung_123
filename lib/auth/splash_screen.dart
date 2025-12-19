import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/providers/auth_provider/auth_provider.dart';
import 'login_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends ConsumerWidget {
  static const String route = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    return authState.when(
      data: (state) {
        return switch (state) {
          AuthUnauthenticated() => LoginScreen(),
          AuthAuthenticated(user: final user) => OnboardingScreen(),
          AuthRequestOtp(email: final email) => LoginScreen(),
        };
      },
      error: (e, s) => Scaffold(body: Center(child: Text('Error: $e'))),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
