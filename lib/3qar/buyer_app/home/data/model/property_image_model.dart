import 'package:json_annotation/json_annotation.dart';

part 'property_image_model.g.dart';

@JsonSerializable()
class PropertyImageModel {
  @JsonKey(name: 'image_url')
  final String imageUrl;

  const PropertyImageModel({required this.imageUrl});

  factory PropertyImageModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyImageModelToJson(this);
}
