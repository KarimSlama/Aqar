import 'package:aqar/core/common/widgets/loaders/aqar_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../constants/aqar_sizes.dart';

class ProfileShimmerLoading extends StatelessWidget {
  const ProfileShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AqarSizes.md,
      children: [
        AqarShimmerEffect(width: 60, height: 60),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AqarSizes.xs,
          children: [
            AqarShimmerEffect(width: 100, height: 20),
            AqarShimmerEffect(width: 200, height: 20),
          ],
        ),
      ],
    );
  }
}
