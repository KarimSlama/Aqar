import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../../../helpers/helper_functions.dart';
import '../images/cached_images.dart';

class NormalAqarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String? image;
  final bool hasLeading, isConversation;
  final List<Widget>? actions;

  const NormalAqarAppBar({
    super.key,
    required this.text,
    this.hasLeading = false,
    this.isConversation = false,
    this.image,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isConversation
          ? Row(
              spacing: AqarSizes.sm,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedImage(width: 40, height: 40, image: image ?? ''),
                ),
                Text(text),
              ],
            )
          : Text(text),
      automaticallyImplyLeading: hasLeading,
      leading: hasLeading
          ? IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Iconsax.arrow_left_2_copy,
                color: AqarHelperFunctions.isDark(context)
                    ? AqarColors.white
                    : AqarColors.black,
              ),
            )
          : SizedBox.shrink(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AqarSizes.appBarHeight);
}
