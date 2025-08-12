import 'package:aqar/3qar/buyer_app/profile/data/model/profile_args.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/common/widgets/texts/header_text_with_subtitle.dart';
import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/common/widgets/row/contact_information_row.dart';
import '../../../core/constants/aqar_colors.dart';
import '../../../core/helpers/helper_functions.dart';
import 'widget/about_me_section_with_text_field.dart';
import 'widget/recent_properties_related_to_current_user.dart';
import 'widget/user_review.dart';

class PersonalInformationScreen extends StatelessWidget {
  final ProfileArgs profileArgs;
  const PersonalInformationScreen({super.key, required this.profileArgs});

  @override
  Widget build(BuildContext context) {
    final profile = profileArgs.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(AqarString.personalInformation),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Iconsax.arrow_left_2_copy,
            color: AqarHelperFunctions.isDark(context)
                ? AqarColors.white
                : AqarColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AqarSizes.ms, vertical: AqarSizes.md),
          child: Center(
            child: Column(
              spacing: AqarSizes.sm,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedImage(
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      image: profile.image ??
                          'https://tse1.mm.bing.net/th/id/OIP.aVO1XBagtOvg5cfua1-hDgHaHa?rs=1&pid=ImgDetMain&o=7&rm=3'),
                ),
                HeaderTextwithSubTitle(
                    title: profile.fullName,
                    subtitle: profile.userType ?? AqarString.notSpecified,
                    isStartAligned: false),
                const SizedBox(height: AqarSizes.sm),
                SectionHeading(
                    text: AqarString.contactInformation, isActionButton: false),
                ContactInformationRow(
                    icon: Iconsax.call, text: profile.formatedPhone),
                ContactInformationRow(
                    icon: Iconsax.message,
                    text: profile.email ?? AqarString.notSpecified),
                const SizedBox(height: AqarSizes.sm),
                AboutMeSectionWithTextField(profileArgs: profileArgs),
                UserReview(
                  profileCubit: profileArgs.profileCubit,
                  sellerId: profile.userType == 'seller' ? profile.id! : '',
                ),
                RecentPropertiesRelatedToCurrentUser(profileArgs: profileArgs)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
