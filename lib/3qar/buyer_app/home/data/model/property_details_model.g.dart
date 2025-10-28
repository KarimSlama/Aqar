// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyDetailsModel _$PropertyDetailsModelFromJson(
        Map<String, dynamic> json) =>
    PropertyDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      propertyName: json['property_name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      location: json['location'] as String,
      numberOfRooms: (json['number_of_rooms'] as num?)?.toInt(),
      ownerId: json['owner_id'] as String?,
      unitId: json['unit_id'] as String,
      numberOfBeds: (json['number_of_beds'] as num?)?.toInt(),
      numberOfBathrooms: (json['number_of_bathrooms'] as num?)?.toInt(),
      area: (json['area'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      developerId: json['developer_id'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      builtInYear: (json['built_in_year'] as num?)?.toInt(),
      deliveryInYear: (json['delivery_in_year'] as num?)?.toInt(),
      saleType: json['sale_type'] as String?,
      referenceNumber: json['reference_number'] as String?,
      finishing: json['finishing'] as String?,
      numberOfLivingRooms: (json['number_of_living_rooms'] as num?)?.toInt(),
      garageForCars: (json['garage_for_cars'] as num?)?.toInt(),
      downPayment: (json['down_payment'] as num?)?.toInt(),
      installmentPeriodYears:
          (json['installment_period_years'] as num?)?.toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      totalReviewsCount: (json['total_reviews_count'] as num?)?.toInt(),
      propertyImages: (json['property_images'] as List<dynamic>?)
              ?.map(
                  (e) => PropertyImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      propertyFeatures: (json['property_features'] as List<dynamic>?)
              ?.map((e) =>
                  PropertyFeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      developer: json['developers'] == null
          ? null
          : DeveloperRequestModel.fromJson(
              json['developers'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyDetailsModelToJson(
        PropertyDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_name': instance.propertyName,
      'description': instance.description,
      'price': instance.price,
      'number_of_rooms': instance.numberOfRooms,
      'location': instance.location,
      'owner_id': instance.ownerId,
      'unit_id': instance.unitId,
      'number_of_beds': instance.numberOfBeds,
      'number_of_bathrooms': instance.numberOfBathrooms,
      'area': instance.area,
      'created_at': instance.createdAt,
      'developer_id': instance.developerId,
      'built_in_year': instance.builtInYear,
      'delivery_in_year': instance.deliveryInYear,
      'sale_type': instance.saleType,
      'reference_number': instance.referenceNumber,
      'finishing': instance.finishing,
      'number_of_living_rooms': instance.numberOfLivingRooms,
      'garage_for_cars': instance.garageForCars,
      'down_payment': instance.downPayment,
      'installment_period_years': instance.installmentPeriodYears,
      'average_rating': instance.averageRating,
      'total_reviews_count': instance.totalReviewsCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'property_images': instance.propertyImages,
      'property_features': instance.propertyFeatures,
      'developers': instance.developer,
    };
