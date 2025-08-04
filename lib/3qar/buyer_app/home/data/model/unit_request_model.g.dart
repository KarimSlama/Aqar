// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitRequestModel _$UnitRequestModelFromJson(Map<String, dynamic> json) =>
    UnitRequestModel(
      id: json['id'] as String?,
      unitName: json['unit_name'] as String,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      image: json['image'] as String,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => PropertyRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitRequestModelToJson(UnitRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unit_name': instance.unitName,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'image': instance.image,
      'properties': instance.properties,
    };
