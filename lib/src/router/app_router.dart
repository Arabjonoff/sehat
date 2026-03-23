import 'package:go_router/go_router.dart';
import 'package:sehat/src/ui/splash/onboard/onboard_screen.dart';
import 'package:sehat/src/ui/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardScreen(),
    ),
  ]
);