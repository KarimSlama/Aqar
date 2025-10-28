import 'package:json_annotation/json_annotation.dart';
import 'developer_request_model.dart';
import 'property_image_model.dart';
import 'property_feature_model.dart';

part 'property_details_model.g.dart';

@JsonSerializable()
class PropertyDetailsModel {
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
  @JsonKey(name: 'built_in_year')
  final int? builtInYear;
  @JsonKey(name: 'delivery_in_year')
  final int? deliveryInYear;
  @JsonKey(name: 'sale_type')
  final String? saleType;
  @JsonKey(name: 'reference_number')
  final String? referenceNumber;
  final String? finishing;
  @JsonKey(name: 'number_of_living_rooms')
  final int? numberOfLivingRooms;
  @JsonKey(name: 'garage_for_cars')
  final int? garageForCars;
  @JsonKey(name: 'down_payment')
  final int? downPayment;
  @JsonKey(name: 'installment_period_years')
  final int? installmentPeriodYears;
  @JsonKey(name: 'average_rating')
  final double? averageRating;
  @JsonKey(name: 'total_reviews_count')
  final int? totalReviewsCount;

  final double? latitude;
  final double? longitude;

  @JsonKey(name: 'property_images')
  final List<PropertyImageModel> propertyImages;
  @JsonKey(name: 'property_features')
  final List<PropertyFeatureModel> propertyFeatures;
  @JsonKey(name: 'developers')
  final DeveloperRequestModel? developer;

  const PropertyDetailsModel({
    this.id,
    required this.propertyName,
    required this.description,
    required this.price,
    required this.location,
    this.numberOfRooms,
    this.ownerId,
    required this.unitId,
    this.numberOfBeds,
    this.numberOfBathrooms,
    this.area,
    this.createdAt,
    this.developerId,
    this.latitude,
    this.longitude,
    this.builtInYear,
    this.deliveryInYear,
    this.saleType,
    this.referenceNumber,
    this.finishing,
    this.numberOfLivingRooms,
    this.garageForCars,
    this.downPayment,
    this.installmentPeriodYears,
    this.averageRating,
    this.totalReviewsCount,
    this.propertyImages = const [],
    this.propertyFeatures = const [],
    this.developer,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDetailsModelToJson(this);
}
