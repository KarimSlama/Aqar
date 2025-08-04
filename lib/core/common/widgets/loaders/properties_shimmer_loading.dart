import 'package:flutter/material.dart';

import 'aqar_shimmer.dart';

class PropertiesShimmerLoading extends StatelessWidget {
  const PropertiesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: List.generate(2, (rowIndex) {
        return Flexible(
          child: rowIndex % 2 == 0
              ? AqarShimmerEffect(
                  height: 200,
                  width: 190,
                )
              : AqarShimmerEffect(
                  width: 190,
                  height: 200,
                ),
        );
      }),
    );
  }
}
