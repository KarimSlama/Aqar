import 'package:flutter/material.dart';

import '../../../../core/common/widgets/row/row_icon_with_title.dart';

class PropertyFeaturesIconWithTextWidget extends StatelessWidget {
  final String featureTitle, iconTitle;
  final IconData icon;
  const PropertyFeaturesIconWithTextWidget({
    super.key,
    required this.featureTitle,
    required this.icon,
    required this.iconTitle,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowIconWithTitle(
              icon: icon,
              text: iconTitle,
              iconSize: 26,
              style: Theme.of(context).textTheme.titleLarge),
          Text(featureTitle)
        ],
      ),
    );
  }
}
