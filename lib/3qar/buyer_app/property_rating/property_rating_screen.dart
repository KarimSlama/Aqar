import 'package:aqar/3qar/buyer_app/property_rating/controller/cubit/rating_cubit.dart';
import 'package:aqar/3qar/buyer_app/property_rating/controller/cubit/rating_state.dart';
import 'package:aqar/core/common/widgets/app_bar/main_app_bar.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import '../../../core/common/widgets/properties/aqar_rating_bar_indicator.dart';
import '../../../core/constants/aqar_sizes.dart';
import '../../../gen/assets.gen.dart';
import 'widgets/list_of_user_ratings_card.dart';
import 'widgets/overall_property_rating.dart';

class PropertyRatingScreen extends StatelessWidget {
  final int propertyId;

  const PropertyRatingScreen({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAqarAppBar(title: AqarString.propertyRating),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(AqarSizes.defaultSpace),
          child: BlocBuilder<RatingCubit, RatingState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () =>
                    Center(child: SpinKitSpinningLines(color: AqarColors.gold)),
                success: (ratings) => (ratings.totalReviewsCount == 0)
                    ? Column(
                        children: [
                          Lottie.asset(Assets.images.empty),
                          Text(AqarString.noRatingYet),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: AqarSizes.spaceBtwItems,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AqarString
                              .ratingsAndReviewsAreVerifiedAndFromPeopleWhoUseTheSameTypeOfDeviceThatYouUse),
                          OverallPropertyRating(
                              ratingCounts: ratings.ratingCounts!,
                              overalRating:
                                  ratings.averageRating!.toStringAsFixed(1)),
                          AqarRatingBarIndicator(
                              rating: ratings.averageRating ?? 0.0),
                          Text('${ratings.totalReviewsCount}',
                              style: Theme.of(context).textTheme.bodySmall),
                          ListOfUserRatingsCard(ratings: ratings.reviews!),
                        ],
                      ),
                error: (error) => Text(error),
                orElse: () => SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
