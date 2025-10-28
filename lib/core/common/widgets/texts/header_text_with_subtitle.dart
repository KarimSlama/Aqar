import 'package:flutter/material.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';

class HeaderTextwithSubTitle extends StatelessWidget {
  final String title, subtitle;
  final bool isStartAligned;
  const HeaderTextwithSubTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.isStartAligned = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isStartAligned ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      spacing: AqarSizes.xs,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: AqarColors.grey),
        ),
      ],
    );
  }
}
