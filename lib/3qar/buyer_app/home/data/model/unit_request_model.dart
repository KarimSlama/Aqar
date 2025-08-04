import 'package:aqar/3qar/buyer_app/home/data/model/property_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'unit_request_model.g.dart';

@JsonSerializable()
class UnitRequestModel {
  final String? id;
  @JsonKey(name: 'unit_name')
  final String unitName;
  final String? description;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final String image;

  final List<PropertyRequestModel>? properties;

  const UnitRequestModel({
    this.id,
    required this.unitName,
    this.description,
    this.createdAt,
    required this.image,
    this.properties,
  });

  factory UnitRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UnitRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnitRequestModelToJson(this);
}
