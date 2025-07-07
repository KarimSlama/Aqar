import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:aqar/core/validation/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../core/constants/aqar_sizes.dart';
import '../../../core/constants/aqar_string.dart';

class LoginTextFormFields extends StatefulWidget {
  const LoginTextFormFields({
    super.key,
  });

  @override
  State<LoginTextFormFields> createState() => _LoginTextFormFieldsState();
}

bool isVisible = false;

class _LoginTextFormFieldsState extends State<LoginTextFormFields> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.loginFormKey,
      child: Column(
        spacing: AqarSizes.spaceBtwItems,
        children: [
          AqarTextFormField(
            label: AqarString.email,
            prefixIcon: Iconsax.direct_right_copy,
            validator: (value) => Validator.validateEmail(value),
            inputType: TextInputType.text,
            controller: loginCubit.emailController,
          ),
          AqarTextFormField(
            label: AqarString.password,
            prefixIcon: Iconsax.password_check_copy,
            validator: (value) => Validator.validatePassword(value),
            inputType: TextInputType.visiblePassword,
            isObscureText: isVisible,
            suffixIcon: isVisible ? Iconsax.eye_slash_copy : Iconsax.eye_copy,
            suffixPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            maxLines: 1,
            controller: loginCubit.passwordController,
          ),
        ],
      ),
    );
  }
}
