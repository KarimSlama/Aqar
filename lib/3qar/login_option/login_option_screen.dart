import 'package:aqar/3qar/login_option/widgets/grid_view_for_top_images.dart';
import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../core/common/widgets/texts/register_text_button.dart';
import '../../core/constants/aqar_string.dart';
import '../../core/routing/routes.dart';
import 'widgets/continue_with_email_login.dart';
import 'widgets/social_method.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      Assets.images.house4Png.path,
      Assets.images.house5Png.path,
      Assets.images.house6.path,
      Assets.images.house7.path,
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AqarSizes.ms),
          child: Column(
            spacing: AqarSizes.defaultSpace,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridViewForTopImages(images: images),
              SpanText(
                  text: AqarString.readyTo,
                  actionText: AqarString.explore,
                  actionTextStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: AqarColors.darkBlue),
                  textStyle: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: AqarSizes.spaceBtwItems),
              ContinueWithEmailLogin(),
              Center(child: Text(AqarString.or)),
              SocialMethod(),
              RegisterTextButton(
                  text: AqarString.dontHaveAnAccount,
                  actionText: AqarString.register,
                  onActionTextTap: () =>
                      context.pushNamed(Routes.signUpScreen)),
            ],
          ),
        ),
      ),
    );
  }
}
