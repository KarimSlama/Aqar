import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';
import '../container/rounded_container.dart';
import '../row/row_icon_with_title.dart';

class RatingCircularContainerWithTextAndIcon extends StatelessWidget {
  final String ratingText;
  final int propertyId;
  const RatingCircularContainerWithTextAndIcon(
      {super.key, required this.ratingText, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      bgColor: AqarColors.white,
      isText: false,
      radius: 25,
      padding: EdgeInsetsDirectional.symmetric(
          vertical: AqarSizes.sm, horizontal: AqarSizes.ms),
      child: RowIconWithTitle(
          icon: Iconsax.star,
          text: double.tryParse(ratingText)!.toStringAsFixed(1),
          iconColor: AqarColors.gold,
          textColor: AqarColors.black),
    );
  }
}
