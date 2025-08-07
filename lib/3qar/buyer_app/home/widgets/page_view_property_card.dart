import 'package:aqar/3qar/buyer_app/property_details/data/model/property_args.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/images/cached_images.dart';
import '../../../../core/common/widgets/row/developer_logo_with_location_and_property_name_row.dart';
import '../../../../core/common/widgets/row/row_icon_with_title.dart';
import '../../../../core/common/widgets/separators/heigth_separators.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/helpers/helper_functions.dart';
import '../../../../core/routing/routes.dart';

class PageViewPropertyCard extends StatelessWidget {
  final dynamic property;
  const PageViewPropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.propertyDetailsScreen,
          arguments:
              PropertyArgs(property: property, imageTag: 'uniqueImageTag')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          elevation: 3,
          color: AqarHelperFunctions.isDark(context)
              ? AqarColors.light.withValues(alpha: .1)
              : AqarColors.light.withValues(alpha: .9),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              Hero(
                tag: 'uniqueImageTag',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AqarSizes.borderRadiusLg),
                  child: property.propertyImages.isNotEmpty
                      ? CachedImage(
                          image: property.propertyImages[0].imageUrl,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image_not_supported),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(AqarSizes.ms),
                  child: Column(
                    children: [
                      DeveloperLogoWithLocationAndPropertyNameRow(
                        logo: property.developer!.companyLogoUrl!,
                        propertyLocation: property.location,
                        propertyName: property.propertyName,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowIconWithTitle(
                            icon: Icons.bed_outlined,
                            text: '${property.numberOfBeds} Beds',
                          ),
                          HeightSeperator(),
                          RowIconWithTitle(
                            icon: Icons.shower,
                            text: '${property.numberOfBathrooms} Bath',
                          ),
                          HeightSeperator(),
                          RowIconWithTitle(
                            icon: Iconsax.slider_horizontal_1_copy,
                            text: '${property.area} m',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
