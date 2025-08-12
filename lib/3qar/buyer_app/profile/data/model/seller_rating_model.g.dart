// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerRatingModel _$SellerRatingModelFromJson(Map<String, dynamic> json) =>
    SellerRatingModel(
      id: (json['id'] as num?)?.toInt(),
      sellerId: json['seller_id'] as String,
      buyerId: json['buyer_id'] as String,
      user: json['profiles'] == null
          ? null
          : UserModel.fromJson(json['profiles'] as Map<String, dynamic>),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$SellerRatingModelToJson(SellerRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seller_id': instance.sellerId,
      'buyer_id': instance.buyerId,
      'profiles': instance.user,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt,
    };
