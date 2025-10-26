import 'package:aqar/3qar/buyer_app/home/data/model/property_image_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/icons/map_icon.dart';
import '../../../../core/common/widgets/row/row_icon_with_title.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../core/constants/aqar_sizes.dart';

class PropertyNameWithLocationAndMapIcon extends StatelessWidget {
  final String propertyName;
  final String location;
  final double latitude, longitude;
  final List<PropertyImageModel> propertyImages;
  const PropertyNameWithLocationAndMapIcon({
    super.key,
    required this.propertyName,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.propertyImages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: AqarSizes.sm,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(text: '$propertyName🏡', isActionButton: false),
            RowIconWithTitle(icon: Iconsax.location_copy, text: location),
          ],
        ),
        MapIcon(
            latitude: latitude,
            longitude: longitude,
            propertyName: propertyName,
            propertyImages: propertyImages),
      ],
    );
  }
}
