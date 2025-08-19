import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../../core/constants/aqar_colors.dart';

class FlexibleTextFormField extends StatelessWidget {
  const FlexibleTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AqarTextFormField(
        inputType: TextInputType.text,
        controller: TextEditingController(),
        hint: AqarString.search,
        prefixIcon: Iconsax.search_normal_1_copy,
        borderColor: Colors.transparent,
        hintColor: AqarColors.light,
        isDisabeldBoarder: true,
      ),
    );
  }
}
