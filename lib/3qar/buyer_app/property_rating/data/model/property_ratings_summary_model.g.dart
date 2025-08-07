// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_ratings_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRatingsSummaryModel _$PropertyRatingsSummaryModelFromJson(
        Map<String, dynamic> json) =>
    PropertyRatingsSummaryModel(
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => RatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      totalReviewsCount: (json['total_reviews_count'] as num?)?.toInt(),
      ratingCounts: (json['rating_counts'] as List<dynamic>?)
          ?.map((e) => StarRatingCountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertyRatingsSummaryModelToJson(
        PropertyRatingsSummaryModel instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
      'average_rating': instance.averageRating,
      'total_reviews_count': instance.totalReviewsCount,
      'rating_counts': instance.ratingCounts,
    };
