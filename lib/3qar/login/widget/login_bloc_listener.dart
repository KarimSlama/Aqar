import 'package:aqar/3qar/login/controller/login_state.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/popups/loaders.dart';
import '../../../core/constants/constants.dart';
import '../controller/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) => state.maybeWhen(
        loading: () => CircularProgressIndicator(),
        success: (id) {
          SharedPreference.setSecureString(Constants.USER_KEY, id);
          return Loaders.successSnackBar(
              context: context,
              title: AqarString.congratulations,
              message: AqarString.youLoggedInSuccessfully);
        },
        error: (error) => Text(error),
        orElse: () => SizedBox.shrink(),
      ),
      child: SizedBox.shrink(),
    );
  }
}
