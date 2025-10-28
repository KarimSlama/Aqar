// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_rating_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarRatingCountModel _$StarRatingCountModelFromJson(
        Map<String, dynamic> json) =>
    StarRatingCountModel(
      rating: (json['rating'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$StarRatingCountModelToJson(
        StarRatingCountModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'count': instance.count,
    };
