import 'package:flutter/material.dart';
import '../../../../core/common/widgets/card/user_review_card.dart';
import '../../../../core/utils/rating_model_args.dart';

class ListOfUserRatingsCard extends StatelessWidget {
  final dynamic ratings;

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
          ratings: RatingModelArgs(
              image: ratings[index].user!.image ?? '',
              fullName: ratings[index].user!.fullName,
              comment: ratings[index].comment ?? '',
              createdAt: ratings[index].createdAt ?? '',
              rating: ratings[index].rating),
          isOwnerReplied: false,
        ),
      ),
    );
  }
}
