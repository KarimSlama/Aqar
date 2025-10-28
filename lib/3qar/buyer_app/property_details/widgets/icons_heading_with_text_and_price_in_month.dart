import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/container/rounded_container.dart';
import '../../../../core/common/widgets/icons/favorite_icons.dart';
import '../../../../core/common/widgets/icons/rating_circular_container_with_text_and_icon.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/helpers/helper_functions.dart';
import '../../../../core/routing/routes.dart';

class IconsHeadingWithTextAndPriceInMonth extends StatelessWidget {
  final String rating;
  final double installment;
  final int propertyId, ratingCount;
  final double overalRating;

  const IconsHeadingWithTextAndPriceInMonth({
    super.key,
    required this.rating,
    required this.installment,
    required this.propertyId,
    required this.overalRating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AqarSizes.ms),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(
                  Routes.propertyRatingScreen,
                  arguments: propertyId,
                ),
                child: RatingCircularContainerWithTextAndIcon(
                    ratingText: rating, propertyId: propertyId),
              ),
              FavoriteIcon(propertyId: propertyId),
            ],
          ),
          SizedBox(
            height: AqarHelperFunctions.screenHeight(context) / 10.5,
          ),
          Text('House Sale',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: AqarColors.white)),
          SizedBox(height: AqarSizes.sm),
          RoundedContainer(
            isText: true,
            text: '${installment.toStringAsFixed(2)}/ Month',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .apply(color: AqarColors.white),
            padding: EdgeInsetsDirectional.symmetric(
                vertical: AqarSizes.ms, horizontal: AqarSizes.sm),
            margin: 0,
            bgColor: AqarColors.light.withValues(alpha: .3),
            borderColor: AqarColors.light,
            borderWidth: 1,
          ),
        ],
      ),
    );
  }
}
