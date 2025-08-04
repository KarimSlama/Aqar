import 'package:json_annotation/json_annotation.dart';

import 'developer_request_model.dart';
part 'property_request_model.g.dart';

@JsonSerializable()
class PropertyRequestModel {
  final int? id;
  @JsonKey(name: 'property_name')
  final String propertyName;
  final String description;
  final double price;
  @JsonKey(name: 'number_of_rooms')
  final int? numberOfRooms;
  final String location;
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  @JsonKey(name: 'features')
  final List<String> features;
  @JsonKey(name: 'unit_id')
  final String unitId;
  @JsonKey(name: 'number_of_beds')
  final int? numberOfBeds;
  @JsonKey(name: 'number_of_bathrooms')
  final int? numberOfBathrooms;
  final int? area;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'developer_id')
  final String? developerId;

  @JsonKey(name: 'developers')
  final DeveloperRequestModel? developer;

  const PropertyRequestModel({
    this.id,
    required this.propertyName,
    required this.description,
    required this.price,
    required this.location,
    this.numberOfRooms,
    this.ownerId,
    required this.unitId,
    this.imageUrls = const [],
    this.features = const [],
    this.createdAt,
    this.area,
    this.numberOfBathrooms,
    this.numberOfBeds,
    this.developerId,
    this.developer,
  });

  factory PropertyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyRequestModelToJson(this);
}
