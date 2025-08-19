import 'package:aqar/3qar/buyer_app/profile/controller/cubit/profile_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile/controller/cubit/profile_state.dart';
import 'package:aqar/3qar/buyer_app/profile/data/model/profile_enum.dart';
import 'package:aqar/core/common/widgets/popups/loaders.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDetailsBlocListener extends StatelessWidget {
  const ProfileDetailsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      bloc: getIt<ProfileCubit>(),
      listener: (context, state) {
        if (state.updated == ProfileUpdateDataState.updated) {
          return Loaders.successSnackBar(
              context: context,
              title: 'So Good🎉',
              message: 'Personal Details Successfully Updated');
        } else if (state.errorMessage == ProfileDataState.error) {
          Loaders.errorSnackBar(
              context: context,
              title: 'Error',
              message: state.errorMessage ??
                  'Something went wrong while reload data');
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
