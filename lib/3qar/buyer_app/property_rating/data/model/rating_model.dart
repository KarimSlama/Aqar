import 'package:json_annotation/json_annotation.dart';

import '../../../../sign_up/data/model/user_model.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  final int? id;

  @JsonKey(name: 'property_id')
  final int propertyId;

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'profiles')
  final UserModel? user;

  final double rating;
  final String? comment;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  const RatingModel({
    this.id,
    required this.propertyId,
    required this.userId,
    required this.rating,
    this.user,
    this.comment,
    this.createdAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
