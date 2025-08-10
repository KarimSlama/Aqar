import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  @JsonKey(name: 'property_id')
  final int propertyId;
  @JsonKey(name: 'user_id')
  final String userId;

  FavoriteModel({required this.propertyId, required this.userId});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}
