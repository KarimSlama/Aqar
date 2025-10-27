import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/aqar_colors.dart';
import '../../../../../core/constants/aqar_sizes.dart';

class RowIconWithTitle extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor, textColor;
  final double? iconSize;
  final TextStyle? style;
  const RowIconWithTitle(
      {super.key,
      required this.icon,
      required this.text,
      this.iconColor = AqarColors.primary,
      this.iconSize,
      this.style,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AqarSizes.sm,
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor ??
              (AqarHelperFunctions.isDark(context)
                  ? AqarColors.white
                  : AqarColors.grey),
        ),
        Text(text,
            style: style ??
                Theme.of(context).textTheme.bodySmall!.apply(color: textColor)),
      ],
    );
  }
}
