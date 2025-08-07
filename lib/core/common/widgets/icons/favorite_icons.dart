import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../circulars/circular_container.dart';

class FavoriteIcon extends StatelessWidget {
  final String propertyId;
  final VoidCallback? onTap;
  const FavoriteIcon({super.key, required this.propertyId, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircularContainer(
        width: 35,
        height: 35,
        color: AqarColors.white,
        child: Icon(Iconsax.heart, color: AqarColors.red),
      ),
    );
  }
}
