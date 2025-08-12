import 'package:aqar/3qar/buyer_app/profile/controller/cubit/profile_cubit.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';

import '../../../home/controller/home_cubit.dart';

class ProfileArgs {
  final UserModel user;
  final HomeCubit homeCubit;
  final ProfileCubit profileCubit;

  ProfileArgs({
    required this.user,
    required this.homeCubit,
    required this.profileCubit,
  });
}
