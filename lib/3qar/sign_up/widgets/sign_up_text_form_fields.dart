import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../core/constants/aqar_string.dart';
import '../../../core/validation/validator.dart';
import '../data/model/sign_up_form_user_type.dart';

class SignUpTextFormFields extends StatefulWidget {
  const SignUpTextFormFields({super.key});

  @override
  State<SignUpTextFormFields> createState() => _SignUpTextFormFieldsState();
}

bool isPasswordObscureText = true;

const List<SignUpFormUserType> _userTypes = [
  SignUpFormUserType('Buyer', 'buyer'),
  SignUpFormUserType('Seller', 'seller'),
];

class _SignUpTextFormFieldsState extends State<SignUpTextFormFields> {
  String _selectedUserType = _userTypes[0].value;
  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return Form(
      key: signUpCubit.signUpFormKey,
      child: Column(
        spacing: AqarSizes.spaceBtwItems,
        children: [
          DropdownButtonFormField<String>(
            initialValue: _selectedUserType,
            decoration: InputDecoration(
              labelText: 'Account Type',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: _userTypes
                .map((type) => DropdownMenuItem<String>(
                      value: type.value,
                      child: Text(type.label),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedUserType = value;
                });
                signUpCubit.setUserType(value);
              }
            },
          ),
          Row(
            spacing: AqarSizes.spaceBtwItems,
            children: [
              Expanded(
                child: AqarTextFormField(
                  label: AqarString.firstName,
                  prefixIcon: Iconsax.profile_2user_copy,
                  validator: (value) =>
                      Validator.validateEmptyText('first name', value),
                  inputType: TextInputType.text,
                  controller: signUpCubit.firstNameController,
                ),
              ),
              Expanded(
                child: AqarTextFormField(
                  label: AqarString.lastName,
                  prefixIcon: Iconsax.profile_2user_copy,
                  validator: (value) =>
                      Validator.validateEmptyText('last name', value),
                  inputType: TextInputType.text,
                  controller: signUpCubit.lastNameController,
                ),
              ),
            ],
          ),
          AqarTextFormField(
            label: AqarString.email,
            prefixIcon: Iconsax.direct_right_copy,
            validator: (value) => Validator.validateEmail(value),
            inputType: TextInputType.emailAddress,
            controller: signUpCubit.emailController,
          ),
          AqarTextFormField(
            label: AqarString.phone,
            prefixIcon: Iconsax.call,
            validator: (value) => Validator.validatePhone(value),
            inputType: TextInputType.phone,
            controller: signUpCubit.phoneController,
          ),
          AqarTextFormField(
            label: AqarString.password,
            prefixIcon: Iconsax.password_check_copy,
            validator: (value) => Validator.validatePassword(value),
            inputType: TextInputType.visiblePassword,
            isObscureText: isPasswordObscureText,
            suffixIcon: isPasswordObscureText
                ? Iconsax.eye_slash_copy
                : Iconsax.eye_copy,
            suffixPressed: () {
              setState(() {
                isPasswordObscureText = !isPasswordObscureText;
              });
            },
            maxLines: 1,
            controller: signUpCubit.passwordController,
          ),
        ],
      ),
    );
  }
}
