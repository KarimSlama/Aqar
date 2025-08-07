import 'package:aqar/3qar/buyer_app/property_rating/data/model/rating_model.dart';
import 'package:flutter/material.dart';
import 'user_review_card.dart';

class ListOfUserRatingsCard extends StatelessWidget {
  final List<RatingModel> ratings;

  const ListOfUserRatingsCard({
    super.key,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        ratings.length,
        (index) => UserReviewCard(
            key: ValueKey(ratings[index].id),
            ratings: ratings,
            isPropertyOwnerReplied: false,
            index: index),
      ),
    );
  }
}
