import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_string.dart';
import '../../profile/controller/profile/profile_cubit.dart';
import '../../profile/controller/profile/profile_state.dart';

class UpdateContactPersonalInformation extends StatelessWidget {
  const UpdateContactPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionHeading(
                text: AqarString.contactInformation,
                isActionButton: false,
                icon: Iconsax.edit_2,
                isIcon: true,
                onPressed: () => profileCubit.changeEnabledState()),
            AqarTextFormField(
              inputType: TextInputType.text,
              controller: profileCubit.firstNameController,
              borderColor: Colors.transparent,
              isEnabled: profileCubit.isEnabled,
            ),
            AqarTextFormField(
              inputType: TextInputType.text,
              controller: profileCubit.lastNameController,
              borderColor: Colors.transparent,
              isEnabled: profileCubit.isEnabled,
            ),
            AqarTextFormField(
              inputType: TextInputType.phone,
              controller: profileCubit.phoneController,
              borderColor: Colors.transparent,
              isEnabled: profileCubit.isEnabled,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            profileCubit.isEnabled
                                ? AqarColors.green
                                : AqarColors.grey)),
                    onPressed: () => profileCubit.isEnabled == true
                        ? context
                            .read<ProfileCubit>()
                            .updateSingleFieldData()
                            .then((value) => profileCubit.changeEnabledState())
                        : null,
                    child: Text(AqarString.save))),
          ],
        );
      },
    );
  }
}
