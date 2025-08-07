import 'package:json_annotation/json_annotation.dart';

part 'star_rating_count_model.g.dart';

@JsonSerializable()
class StarRatingCountModel {
  final int rating;
  final int count;

  const StarRatingCountModel({
    required this.rating,
    required this.count,
  });

  factory StarRatingCountModel.fromJson(Map<String, dynamic> json) =>
      _$StarRatingCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$StarRatingCountModelToJson(this);
}
