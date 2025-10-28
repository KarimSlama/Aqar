import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_sizes.dart';
import 'property_features_icon_with_text_widget.dart';

class PropertyFeaturesDetails extends StatelessWidget {
  final int noOfBathroom,
      noOfBedrooms,
      area,
      buildInYear,
      noOfLivingRoom,
      garageForCars;
  const PropertyFeaturesDetails({
    super.key,
    required this.noOfBathroom,
    required this.noOfBedrooms,
    required this.area,
    required this.buildInYear,
    required this.noOfLivingRoom,
    required this.garageForCars,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> propertyFeatures = [
      {
        'icon': Icons.bed_outlined,
        'iconTitle': '$noOfBedrooms',
        'featureTitle': AqarString.bedrooms
      },
      {
        'icon': Icons.bathtub_outlined,
        'iconTitle': '$noOfBathroom',
        'featureTitle': AqarString.bathrooms,
      },
      {
        'icon': Iconsax.pharagraphspacing,
        'iconTitle': '$area',
        'featureTitle': AqarString.areaInSqft
      },
      {
        'icon': Iconsax.timer_1_copy,
        'iconTitle': '$buildInYear',
        'featureTitle': AqarString.buildInYear
      },
      {
        'icon': Iconsax.home_copy,
        'iconTitle': '$noOfLivingRoom',
        'featureTitle': AqarString.livingRoom
      },
      {
        'icon': Iconsax.car_copy,
        'iconTitle': '$garageForCars Cars',
        'featureTitle': AqarString.areaInSqft
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalPaddingAndOverflow =
            (AqarSizes.gridViewLgSpacing * 2) + 7.0;

        final double itemWidth =
            (constraints.maxWidth - totalPaddingAndOverflow) / 3;
        return Wrap(
          alignment: WrapAlignment.start,
          spacing: AqarSizes.gridViewLgSpacing,
          runSpacing: AqarSizes.gridViewLgSpacing,
          children: propertyFeatures.map((feature) {
            return SizedBox(
              width: itemWidth,
              child: PropertyFeaturesIconWithTextWidget(
                icon: feature['icon'] as IconData,
                iconTitle: feature['iconTitle'] as String,
                featureTitle: feature['featureTitle'] as String,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
