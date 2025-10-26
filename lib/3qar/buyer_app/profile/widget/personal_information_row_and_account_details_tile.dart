import 'package:aqar/core/common/widgets/dialog/logout_alert_dialog.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/images/cached_images.dart';
import '../../../../core/common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../core/common/widgets/loaders/profile_shimmer_loading.dart';
import '../../../../core/common/widgets/texts/header_text_with_subtitle.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../core/routing/routes.dart';
import '../controller/cubit/profile_cubit.dart';
import '../controller/cubit/profile_state.dart';
import '../data/model/profile_enum.dart';

class PersonalInformationRowAndAccountDetailsTile extends StatelessWidget {
  const PersonalInformationRowAndAccountDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state.profileDataStatus) {
          case ProfileDataState.loading:
            return ProfileShimmerLoading();
          case ProfileDataState.success:
            final user = state.userData;
            return Column(
              children: [
                Row(
                  spacing: AqarSizes.md,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedImage(
                        width: 60,
                        height: 60,
                        image: user.image!,
                      ),
                    ),
                    HeaderTextwithSubTitle(
                        title: user.fullName, subtitle: user.email!),
                    Spacer(),
                    Container(
                      width: 80.h,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: .5, color: AqarColors.darkGrey),
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                          onPressed: () => showDialog(
                                context: context,
                                builder: (_) => LogoutAccountAlertDialog(
                                  onPressed: () async {
                                    await context.read<ProfileCubit>().logout();
                                    await SharedPreference.removeSecureString(
                                        Constants.USER_KEY);
                                    isLoggedUser = false;
                                    if (context.mounted) {
                                      context.pushNamedAndRemoveUntil(
                                        Routes.loginOptionScreen,
                                        predicate: (route) => false,
                                      );
                                    }
                                  },
                                ),
                              ),
                          child: Text(AqarString.logout)),
                    ),
                  ],
                ),
                SizedBox(height: AqarSizes.md),
                SettingsMenuTile(
                    icon: Iconsax.profile_remove_copy,
                    title: AqarString.personalInformation,
                    onTap: () => context.pushNamed(
                        Routes.personalInformationScreen,
                        arguments: user)),
                SettingsMenuTile(
                    icon: Iconsax.profile_add_copy,
                    title: AqarString.profileDetails,
                    onTap: () => context.pushNamed(Routes.profileDetailsScreen,
                        arguments: user)),
              ],
            );
          case ProfileDataState.error:
            return Text(state.errorMessage ?? 'Error with Profile Data');
        }
      },
    );
  }
}
