import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/container/rounded_container.dart';
import '../../../../core/common/widgets/icons/favorite_icons.dart';
import '../../../../core/common/widgets/images/cached_images.dart';

class RecommendedForYouItemCard extends StatelessWidget {
  final String propertyImage;
  final String propertyName;
  final int propertyId;
  final VoidCallback onTap;
  const RecommendedForYouItemCard(
      {super.key,
      required this.propertyImage,
      required this.propertyId,
      required this.propertyName,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: AqarSizes.md),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              SizedBox(
                  height: AqarHelperFunctions.screenHeight(context),
                  width: AqarHelperFunctions.screenWidth(context) / 1.2,
                  child: CachedImage(
                    image: propertyImage,
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
                        text: propertyName,
                        padding: EdgeInsetsDirectional.all(AqarSizes.sm),
                        isText: true,
                        maxLines: 1,
                        textColor: AqarColors.white,
                      ),
                    ),
                    FavoriteIcon(propertyId: propertyId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
