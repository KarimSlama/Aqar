import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';

class AqarRatingBarIndicator extends StatelessWidget {
  final double rating;
  const AqarRatingBarIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (_, __) => Icon(Iconsax.star_1, color: AqarColors.blue),
      rating: rating,
      itemSize: 20,
      unratedColor: AqarColors.grey,
    );
  }
}
