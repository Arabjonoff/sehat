import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sehat/src/ui/auth/login/login_screen.dart';
import 'package:sehat/src/ui/auth/register/account_screen.dart';
import 'package:sehat/src/ui/auth/register/register_screen.dart';
import 'package:sehat/src/ui/auth/verification/verification_screen.dart';
import 'package:sehat/src/ui/main/main_screen.dart';
import 'package:sehat/src/ui/splash/onboard/onboard_screen.dart';
import 'package:sehat/src/ui/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) => VerificationScreen(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => AccountScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => MainScreen(),
    ),
  ]
);