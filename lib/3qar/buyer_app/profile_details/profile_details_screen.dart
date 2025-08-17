import 'package:aqar/3qar/buyer_app/profile/controller/cubit/profile_cubit.dart';
import 'package:aqar/3qar/buyer_app/profile_details/widget/profile_details_bloc_listener.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/core/common/widgets/row/contact_information_row.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../core/common/widgets/app_bar/normal_app_bar.dart';
import '../../../core/common/widgets/get_location_address.dart';
import '../../../core/constants/aqar_sizes.dart';
import '../../../core/helpers/helper_functions.dart';
import 'widget/profile_image_with_edit_icon.dart';
import 'widget/update_contact_personal_information.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final UserModel profile;
  const ProfileDetailsScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAqarAppBar(text: AqarString.profileDetails),
      body: BlocProvider.value(
        value: getIt<ProfileCubit>(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AqarSizes.ms, vertical: AqarSizes.md),
            child: Column(
              spacing: AqarSizes.md,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImageWithEditIcon(image: profile.image ?? ''),
                SizedBox(height: AqarSizes.defaultSpace),
                GetLocationAddress(),
                ContactInformationRow(
                    text:
                        'Created At: ${AqarHelperFunctions.formatDateTime(profile.createdAt!)}',
                    icon: Iconsax.calendar),
                UpdateContactPersonalInformation(),
                ProfileDetailsBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
