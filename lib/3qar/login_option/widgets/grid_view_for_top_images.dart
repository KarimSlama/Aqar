import 'package:flutter/material.dart';

import '../../../core/common/widgets/layout/grid_view_layout.dart';

class GridViewForTopImages extends StatelessWidget {
  const GridViewForTopImages({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(
      itemCount: images.length,
      mainAxisExtent: 170,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
