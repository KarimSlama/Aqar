import 'package:aqar/3qar/login_option/login_option_screen.dart';
import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/3qar/splash/splash_screen.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../3qar/login/controller/login_cubit.dart';
import '../../3qar/login/login_screen.dart';
import '../../3qar/onboarding/onboarding_screen.dart';
import '../../3qar/sign_up/sign_up_screen.dart';
import '../service_locator/get_it.dart';

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

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
