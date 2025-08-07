import 'package:aqar/3qar/buyer_app/property_rating/data/repository/rating_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final RatingRepository ratingRepository;

  RatingCubit(this.ratingRepository) : super(RatingState.initial());

  bool _isRatingsLoaded = false;
  void fetchRatingsSummaryRelatedToPropertyId(propertyId) async {
    if (_isRatingsLoaded) return;
    emit(RatingState.loading());
    final result =
        await ratingRepository.getPropertiesRatingsSummary(propertyId);

    result.when(success: (ratings) {
      _isRatingsLoaded = true;

      emit(RatingState.success(ratings: ratings));
    }, failure: (error) {
      emit(RatingState.error(error: error));
    });
  }
}
