import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';

class RoundedContainer extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? iconColor, textColor;
  final bool isText;
  final int maxLines;

  const RoundedContainer({
    super.key,
    this.icon,
    this.text,
    this.maxLines = 2,
    required this.isText,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: AqarSizes.ms, vertical: AqarSizes.sm),
      decoration: BoxDecoration(
          color: AqarColors.black.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(26)),
      child: isText
          ? Text(text ?? '',
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: textColor))
          : Icon(icon, color: iconColor ?? AqarColors.white),
    );
  }
}
