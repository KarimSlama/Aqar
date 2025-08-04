import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';

class FilterMenuItems extends StatelessWidget {
  const FilterMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Row(
        spacing: AqarSizes.sm,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Select",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: AqarColors.light)),
          Icon(Iconsax.arrow_down_1_copy, color: AqarColors.light),
        ],
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Get The App"),
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Get The App"),
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Get The App"),
        ),
      ],
    );
  }
}
