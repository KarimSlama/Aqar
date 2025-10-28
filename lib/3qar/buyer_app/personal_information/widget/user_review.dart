import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loaders/rating_shimmer_loading.dart';
import '../../../../core/common/widgets/texts/section_heading.dart';
import '../../profile/controller/profile/profile_cubit.dart';
import '../../profile/controller/profile/profile_state.dart';
import '../../profile/data/model/profile_enum.dart';
import '../../property_rating/widgets/list_of_user_ratings_card.dart';

class UserReview extends StatelessWidget {
  final String sellerId;
  const UserReview({super.key, required this.sellerId});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().fetchSellerRating(sellerId);
    return Column(
      children: [
        SectionHeading(text: AqarString.userReviews),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            switch (state.sellerRatingStatus) {
              case ProfileDataState.loading:
                return RatingShimmerLoading();
              case ProfileDataState.success:
                final ratings = state.sellerRatingData;
                return ratings.isEmpty
                    ? Text(
                        AqarString.noReviewsYet,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      )
                    : ListOfUserRatingsCard(ratings: ratings);

              case ProfileDataState.error:
                return Text('⚠ ${AqarString.thisBuyerHasNoReviewsYet}');
            }
          },
        ),
      ],
    );
  }
}
