import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import 'filter_menu_items.dart';
import 'search_text_form_field.dart';

class FilterHomeSearchContainer extends StatelessWidget {
  const FilterHomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(AqarSizes.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AqarColors.grey, width: .6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AqarSizes.ms,
        children: [
          SearchTextFormField(),
          Container(
            width: .5,
            height: AqarHelperFunctions.screenHeight(context) / 30,
            color: AqarColors.light,
          ),
          FilterMenuItems(),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_4_copy))
        ],
      ),
    );
  }
}
