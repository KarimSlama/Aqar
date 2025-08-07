import 'package:json_annotation/json_annotation.dart';

part 'property_feature_model.g.dart';

@JsonSerializable()
class PropertyFeatureModel {
  @JsonKey(name: 'feature')
  final String feature;

  const PropertyFeatureModel({required this.feature});

  factory PropertyFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyFeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyFeatureModelToJson(this);
}
