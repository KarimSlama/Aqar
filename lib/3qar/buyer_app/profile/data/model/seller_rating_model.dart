import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seller_rating_model.g.dart';

@JsonSerializable()
class SellerRatingModel {
  final int? id;

  @JsonKey(name: 'seller_id')
  final String sellerId;

  @JsonKey(name: 'buyer_id')
  final String buyerId;

  @JsonKey(name: 'profiles')
  final UserModel? user;

  final double rating;
  final String? comment;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const SellerRatingModel({
    this.id,
    required this.sellerId,
    required this.buyerId,
    this.user,
    required this.rating,
    this.comment,
    this.createdAt,
  });

  factory SellerRatingModel.fromJson(Map<String, dynamic> json) =>
      _$SellerRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerRatingModelToJson(this);
}
