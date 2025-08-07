import 'package:json_annotation/json_annotation.dart';
import 'rating_model.dart';
import 'star_rating_count_model.dart';

part 'property_ratings_summary_model.g.dart';

@JsonSerializable()
class PropertyRatingsSummaryModel {
  @JsonKey(name: 'reviews')
  final List<RatingModel>? reviews;

  @JsonKey(name: 'average_rating')
  final double? averageRating;

  @JsonKey(name: 'total_reviews_count')
  final int? totalReviewsCount;
  @JsonKey(name: 'rating_counts')
  final List<StarRatingCountModel>? ratingCounts;

  const PropertyRatingsSummaryModel({
    this.reviews,
    this.averageRating,
    this.totalReviewsCount,
    this.ratingCounts,
  });

  factory PropertyRatingsSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyRatingsSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyRatingsSummaryModelToJson(this);
}
