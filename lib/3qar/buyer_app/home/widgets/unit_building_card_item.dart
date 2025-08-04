import 'dart:ui';
import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:aqar/core/common/widgets/images/cached_images.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../row/row_icon_with_title.dart';

class UnitBuildingCardItem extends StatelessWidget {
  final UnitRequestModel unit;
  final VoidCallback? onTap;

  const UnitBuildingCardItem({
    super.key,
    required this.unit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = AqarHelperFunctions.screenWidth(context);
    final screenHeight = AqarHelperFunctions.screenHeight(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: AqarSizes.ms),
        child: SizedBox(
          width: screenWidth / 2,
          height: screenHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AqarColors.grey.withValues(alpha: 0.3),
                  ),
                  child: unit.image.isNotEmpty
                      ? CachedImage(image: unit.image)
                      : const Center(
                          child: Icon(
                            Iconsax.buildings_copy,
                            size: 50,
                            color: AqarColors.grey,
                          ),
                        ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            color: AqarColors.black.withValues(alpha: .3),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.all(AqarSizes.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                unit.unitName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .apply(color: AqarColors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              RowIconWithTitle(
                                iconColor: AqarColors.light,
                                textColor: AqarColors.white,
                                icon: Iconsax.buildings_copy,
                                text: '${30} Properties',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
