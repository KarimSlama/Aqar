import 'package:flutter/widgets.dart';

import 'aqar_shimmer.dart';

class RecommendedPropertyShimmer extends StatelessWidget {
  const RecommendedPropertyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AqarShimmerEffect(
      height: 300,
      width: double.infinity,
    );
  }
}
