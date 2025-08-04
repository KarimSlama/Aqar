import 'package:aqar/3qar/buyer_app/home/data/model/property_request_model.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/container/rounded_container.dart';
import '../../../../core/common/widgets/images/cached_images.dart';

class RecommendedForYouItemCard extends StatelessWidget {
  final PropertyRequestModel property;
  final int index;
  const RecommendedForYouItemCard(
      {super.key, required this.property, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: AqarSizes.md),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            SizedBox(
                height: AqarHelperFunctions.screenHeight(context),
                width: AqarHelperFunctions.screenWidth(context),
                child: CachedImage(
                  image: property.imageUrls[0],
                )),
            Positioned(
              top: 8,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: RoundedContainer(
                      text: property.propertyName,
                      isText: true,
                      maxLines: 1,
                      textColor: AqarColors.white,
                    ),
                  ),
                  RoundedContainer(
                    icon: Iconsax.heart_copy,
                    isText: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
