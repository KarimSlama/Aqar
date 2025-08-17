import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../../../helpers/helper_functions.dart';

class NormalAqarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const NormalAqarAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Iconsax.arrow_left_2_copy,
          color: AqarHelperFunctions.isDark(context)
              ? AqarColors.white
              : AqarColors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AqarSizes.appBarHeight);
}
