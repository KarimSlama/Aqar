import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../profile/controller/cubit/profile_cubit.dart';
import '../../profile/controller/cubit/profile_state.dart';
import '../../profile/data/model/profile_args.dart';

class AboutMeSectionWithTextField extends StatelessWidget {
  final ProfileArgs profileArgs;
  const AboutMeSectionWithTextField({super.key, required this.profileArgs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: profileArgs.profileCubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AqarSizes.sm,
          children: [
            SectionHeading(
                text: AqarString.aboutMe,
                icon: Iconsax.edit_2,
                onPressed: () {
                  profileArgs.profileCubit.editAboutMe();
                },
                isIcon: true,
                isActionButton: false),
            AqarTextFormField(
              inputType: TextInputType.text,
              controller: profileArgs.profileCubit.aboutMeController,
              borderColor: Colors.transparent,
              isEnabled: profileArgs.profileCubit.isEnabled,
            ),
            profileArgs.profileCubit.isEnabled == true
                ? Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AqarColors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                      onPressed: () {
                        profileArgs.profileCubit.updateSingleFieldData().then(
                            (value) => profileArgs.profileCubit.editAboutMe());
                      },
                      child: Text(
                        AqarString.save,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: AqarColors.black),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
