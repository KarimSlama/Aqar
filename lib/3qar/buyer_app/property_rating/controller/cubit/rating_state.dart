import 'package:aqar/3qar/buyer_app/property_rating/data/model/property_ratings_summary_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_state.freezed.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState.initial() = _Initial;
  const factory RatingState.loading() = loading;
  const factory RatingState.success(
      {required PropertyRatingsSummaryModel ratings}) = Success;
  const factory RatingState.error({required String error}) = Error;
}
