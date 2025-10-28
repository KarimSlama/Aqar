import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:aqar/3qar/login_option/widgets/social_method.dart';
import 'package:aqar/core/common/widgets/aqar_text_form_field.dart';
import 'package:aqar/core/common/widgets/texts/register_text_button.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:aqar/core/validation/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/constants/aqar_sizes.dart';
import 'widget/login_bloc_listener.dart';
import 'widget/login_text_form_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: AqarSizes.ms),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AqarSizes.ms,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AqarString.letsSignIn,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(AqarString.getReadyToFeelConfidentWithANewAqar,
                  style: Theme.of(context).textTheme.bodyMedium),
              LoginTextFormFields(),
              TextButton(
                  onPressed: () async {
                    final controller = TextEditingController(
                        text: context.read<LoginCubit>().emailController.text);
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(AqarString.forgotPassword),
                          content: AqarTextFormField(
                            inputType: TextInputType.emailAddress,
                            controller: controller,
                            validator: (value) =>
                                Validator.validateEmail(value),
                            label: AqarString.email,
                            prefixIcon: Iconsax.direct_right_copy,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => context.pop(),
                              child: Text(AqarString.cancel),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final email = controller.text.trim();
                                if (email.isNotEmpty) {
                                  await context
                                      .read<LoginCubit>()
                                      .sendPasswordResetEmail(email);
                                }
                                if (context.mounted) context.pop();
                              },
                              child: Text(AqarString.apply),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(AqarString.forgotPassword)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final loginCubit = context.read<LoginCubit>();
                    if (loginCubit.loginFormKey.currentState!.validate()) {
                      loginCubit.login();
                    }
                  },
                  child: Text(AqarString.login),
                ),
              ),
              SizedBox(height: AqarSizes.defaultSpace),
              Center(child: Text(AqarString.or)),
              SocialMethod(),
              SizedBox(height: AqarSizes.defaultSpace),
              RegisterTextButton(
                  text: AqarString.dontHaveAnAccount,
                  actionText: AqarString.register,
                  onActionTextTap: () =>
                      context.pushNamed(Routes.signUpScreen)),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
