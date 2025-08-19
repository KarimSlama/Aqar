import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/3qar/sign_up/widgets/sign_up_text_form_fields.dart';
import 'package:aqar/core/common/widgets/texts/text_span.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/common/widgets/texts/register_text_button.dart';
import '../../core/constants/aqar_string.dart';
import '../../core/routing/routes.dart';
import 'widgets/sign_up_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: AqarSizes.ms),
        child: SingleChildScrollView(
          child: Column(
            spacing: AqarSizes.sm,
            children: [
              Image.asset(Assets.images.logo.path),
              Text('Create Your 3qar Account',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(
                textAlign: TextAlign.center,
                'Join 3qar to find your perfect building. Create an account for personalized matches and 3qars resources!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AqarSizes.ms),
              SignUpTextFormFields(),
              SizedBox(height: AqarSizes.sm),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final signUpCubit = context.read<SignUpCubit>();
                    if (signUpCubit.signUpFormKey.currentState!.validate()) {
                      signUpCubit.signUp();
                    }
                  },
                  child: Text(AqarString.signUp),
                ),
              ),
              RegisterTextButton(
                  text: AqarString.alreadyHaveAnAccount,
                  actionText: AqarString.login,
                  onActionTextTap: () => context.pushNamed(Routes.loginScreen)),
              SpanText(
                  text: 'read the ',
                  actionText: 'Terms & Policy',
                  actionTextOnTap: () {}),
              SignUpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
