import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../profile/controller/profile/profile_cubit.dart';
import '../../profile/controller/profile/profile_state.dart';

class AboutMeSectionWithTextField extends StatelessWidget {
  const AboutMeSectionWithTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AqarSizes.sm,
          children: [
            SectionHeading(
                text: AqarString.aboutMe,
                icon: Iconsax.edit_2,
                onPressed: () {
                  profileCubit.changeEnabledState();
                },
                isIcon: true,
                isActionButton: false),
            AqarTextFormField(
              inputType: TextInputType.text,
              controller: profileCubit.aboutMeController,
              borderColor: Colors.transparent,
              isEnabled: profileCubit.isEnabled,
            ),
            profileCubit.isEnabled == true
                ? Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AqarColors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: TextButton(
                      onPressed: () {
                        profileCubit
                            .updateSingleFieldData()
                            .then((value) => profileCubit.changeEnabledState());
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
