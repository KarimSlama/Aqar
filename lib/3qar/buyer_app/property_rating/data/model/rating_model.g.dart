// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      id: (json['id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num).toInt(),
      userId: json['user_id'] as String,
      rating: (json['rating'] as num).toDouble(),
      user: json['profiles'] == null
          ? null
          : UserModel.fromJson(json['profiles'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'profiles': instance.user,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt,
    };
