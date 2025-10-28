import 'package:aqar/core/common/widgets/loaders/aqar_shimmer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/aqar_colors.dart';
import '../../../constants/aqar_sizes.dart';

class RatingShimmerLoading extends StatelessWidget {
  const RatingShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AqarSizes.spaceBtwItems,
      children: [
        Row(
          spacing: AqarSizes.spaceBtwItems,
          children: [
            AqarShimmerEffect(width: 60, height: 60),
            AqarShimmerEffect(width: 80, height: 20),
          ],
        ),
        Row(
          spacing: AqarSizes.spaceBtwItems,
          children: [
            RatingBarIndicator(
              itemBuilder: (_, __) => AqarShimmerEffect(width: 20, height: 20),
              rating: 5,
              itemSize: 20,
              unratedColor: AqarColors.grey,
            ),
            AqarShimmerEffect(width: 100, height: 20),
          ],
        ),
      ],
    );
  }
}
