import 'package:aqar/core/common/widgets/circulars/circular_container_with_shadow.dart';
import 'package:aqar/core/common/widgets/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../3qar/buyer_app/home/data/model/property_image_model.dart';
import '../../../../3qar/buyer_app/property_details/widgets/property_map_dialog.dart';

class MapIcon extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  final String? propertyName;
  final List<PropertyImageModel>? propertyImages;

  const MapIcon({
    super.key,
    this.latitude,
    this.longitude,
    this.propertyName, this.propertyImages,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMapDialog(context),
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

  void _showMapDialog(BuildContext context) {
    if (latitude == null || longitude == null) {
      Loaders.warningSnackBar(
          context: context,
          title: 'not found!',
          message: 'The $propertyName not have a live location!');
      return;
    }

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => PropertyMapDialog(
        latitude: latitude!,
        longitude: longitude!,
        propertyName: propertyName,
        propertyImages: propertyImages,
      ),
    );
  }
}
