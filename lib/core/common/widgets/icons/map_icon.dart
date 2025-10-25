import 'package:aqar/core/common/widgets/circulars/circular_container_with_shadow.dart';
import 'package:aqar/core/constants/location_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MapIcon extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  final String? propertyName;

  const MapIcon({
    super.key,
    this.latitude,
    this.longitude,
    this.propertyName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('MapIcon tapped - lat: $latitude, lng: $longitude');
        LocationConstants.openMap(context, latitude, longitude);
      },
      child: CircularContainerShadow(
        width: 40,
        height: 40,
        widget: Icon(
          Iconsax.map_copy,
          color: (latitude != null && longitude != null) ? null : Colors.grey,
        ),
      ),
    );
  }
}
