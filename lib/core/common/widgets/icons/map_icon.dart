import 'package:aqar/core/common/widgets/circulars/circular_container_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MapIcon extends StatelessWidget {
  final String? propertyId;
  final VoidCallback? onTap;
  const MapIcon({super.key, this.propertyId, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircularContainerShadow(
        width: 40,
        height: 40,
        widget: Icon(Iconsax.map_copy),
      ),
    );
  }
}
