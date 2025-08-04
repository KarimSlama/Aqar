import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/aqar_colors.dart';
import '../../../helpers/helper_functions.dart';

class AqarShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;
  const AqarShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color});

  @override
  Widget build(BuildContext context) {
    final dark = AqarHelperFunctions.isDark(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? AqarColors.grey : AqarColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
