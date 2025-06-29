import 'package:aqar/3qar/login_option/login_option_screen.dart';
import 'package:aqar/3qar/splash/splash_screen.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../3qar/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );

      case Routes.loginOptionScreen:
        return MaterialPageRoute(
          builder: (_) => LoginOptionScreen(),
        );

      default:
        return null;
    }
  }
}
