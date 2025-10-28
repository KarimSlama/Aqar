import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../separators/heigth_separators.dart';

class TitleWithIconInRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isHeading;
  const TitleWithIconInRow({
    super.key,
    required this.text,
    required this.icon,
    this.isHeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AqarSizes.sm,
      children: [
        isHeading ? SizedBox.shrink() : HeightSeperator(),
        Icon(icon, color: AqarColors.primary),
        SizedBox(
          width: isHeading ? MediaQuery.of(context).size.width * 0.25 : null,
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
