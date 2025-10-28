import 'package:aqar/3qar/buyer_app/profile/controller/profile/profile_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile/controller/theme/cubit/theme_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile/controller/theme/cubit/theme_state.dart';
import 'package:aqar/core/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/routing/routes.dart';
import 'widget/personal_information_row_and_account_details_tile.dart';
import 'widget/theme_mode_icon_toggle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..fetchProfileData(),
      child: Scaffold(
        appBar: AppBar(title: Text(AqarString.settings)),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsetsDirectional.symmetric(horizontal: AqarSizes.ms),
            child: Column(
              children: [
                PersonalInformationRowAndAccountDetailsTile(),
                ThemeModeIconToggle(),
                SettingsMenuTile(
                  icon: Iconsax.headphone,
                  title: AqarString.support,
                  trailing: SizedBox.shrink(),
                  onTap: () => context.pushNamed(Routes.supportScreen),
                ),
                SettingsMenuTile(
                  icon: Iconsax.info_circle_copy,
                  title: AqarString.helpInfo,
                  trailing: SizedBox.shrink(),
                  onTap: () => context.pushNamed(Routes.helpAndInfoScreen),
                ),
                SizedBox(height: AqarSizes.defaultSpace),
                SettingsMenuTile(
                    icon: Iconsax.map_copy, title: AqarString.changeLocation),
                SettingsMenuTile(
                    icon: Iconsax.document_favorite,
                    title: AqarString.favoritedPlaces),
                SettingsMenuTile(
                    icon: Iconsax.location, title: AqarString.country),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
