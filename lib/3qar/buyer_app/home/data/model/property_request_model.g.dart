// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyRequestModel _$PropertyRequestModelFromJson(
        Map<String, dynamic> json) =>
    PropertyRequestModel(
      id: (json['id'] as num?)?.toInt(),
      propertyName: json['property_name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      location: json['location'] as String,
      numberOfRooms: (json['number_of_rooms'] as num?)?.toInt(),
      ownerId: json['owner_id'] as String?,
      unitId: json['unit_id'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
      area: (json['area'] as num?)?.toInt(),
      numberOfBathrooms: (json['number_of_bathrooms'] as num?)?.toInt(),
      numberOfBeds: (json['number_of_beds'] as num?)?.toInt(),
      developerId: json['developer_id'] as String?,
      developer: json['developers'] == null
          ? null
          : DeveloperRequestModel.fromJson(
              json['developers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyRequestModelToJson(
        PropertyRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_name': instance.propertyName,
      'description': instance.description,
      'price': instance.price,
      'number_of_rooms': instance.numberOfRooms,
      'location': instance.location,
      'owner_id': instance.ownerId,
      'image_urls': instance.imageUrls,
      'features': instance.features,
      'unit_id': instance.unitId,
      'number_of_beds': instance.numberOfBeds,
      'number_of_bathrooms': instance.numberOfBathrooms,
      'area': instance.area,
      'created_at': instance.createdAt,
      'developer_id': instance.developerId,
      'developers': instance.developer,
    };
