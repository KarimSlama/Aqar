import 'package:aqar/core/constants/constants.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/constants/aqar_colors.dart';
import '../../core/constants/aqar_sizes.dart';
import '../../core/constants/aqar_string.dart';
import '../../core/routing/routes.dart';
import '../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.images.splashBgImage.path,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: AqarColors.blue.withValues(alpha: .4),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AqarSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.logo.path),
                    Text(
                      AqarString.appTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .apply(color: AqarColors.white),
                    ),
                    Text(
                      AqarString.realEstate,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: AqarColors.white),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        if (isLoggedUser) {
                          context.pushNamedAndRemoveUntil(
                            Routes.buyerNavigationMenu,
                            predicate: (route) => false,
                          );
                        } else {
                          context.pushNamedAndRemoveUntil(
                            Routes.onboardingScreen,
                            predicate: (route) => false,
                          );
                        }
                      },
                      child: Text(AqarString.letsStarted),
                    ),
                    Text(
                      AqarString.madeWithLove,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: AqarColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
