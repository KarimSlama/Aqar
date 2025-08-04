import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_sizes.dart';
import '../../row/row_icon_with_title.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        spacing: AqarSizes.sm,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowIconWithTitle(
            icon: Iconsax.location_copy,
            iconColor: AqarHelperFunctions.isDark(context)
                ? AqarColors.white
                : AqarColors.black,
            text: 'Dubai, UAE',
          ),
          Text('Good Morning!', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Iconsax.notification),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AqarSizes.appBarHeight);
}
