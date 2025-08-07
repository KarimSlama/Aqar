import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../../../helpers/helper_functions.dart';

class MainAqarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAqarAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Iconsax.arrow_left_2_copy,
          color: AqarHelperFunctions.isDark(context)
              ? AqarColors.white
              : AqarColors.black,
        ),
      ),
      centerTitle: true,
      title: Text('$title🏡'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AqarSizes.appBarHeight);
}
