import 'package:flutter/material.dart';

import '../../../../core/constants/aqar_sizes.dart';
import '../data/model/star_rating_count_model.dart';
import 'rating_progress_indicator.dart';

class OverallPropertyRating extends StatelessWidget {
  final String overalRating;
  final List<StarRatingCountModel> ratingCounts;

  const OverallPropertyRating({
    super.key,
    required this.overalRating,
    required this.ratingCounts,
  });

  @override
  Widget build(BuildContext context) {
    final totalRatings = ratingCounts.fold(0, (sum, item) => sum + item.count);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            overalRating,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            spacing: AqarSizes.xs,
            children: [
              ...List.generate(5, (index) {
                final ratingStar = 5 - index;
                final count = ratingCounts
                    .firstWhere(
                      (item) => item.rating == ratingStar,
                      orElse: () =>
                          StarRatingCountModel(rating: ratingStar, count: 0),
                    )
                    .count;

                final value = totalRatings > 0 ? count / totalRatings : 0.0;

                return RatingProgressIndicator(
                  text: '$count',
                  value: value,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
