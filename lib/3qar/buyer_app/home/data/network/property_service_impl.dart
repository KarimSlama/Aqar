import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PropertyServiceImpl implements PropertyService {
  final supabase = Supabase.instance.client;

  @override
  Future<ServerResult<List<PropertyDetailsModel>>> getProperties() async {
    try {
      var query = supabase.from('property').select('''
      *,
      property_images(image_url),
      property_features(feature),
      developers(*)
    ''');

      final response = await query;

      final properties = response
          .map<PropertyDetailsModel>(
              (properity) => PropertyDetailsModel.fromJson(properity))
          .toList();
      return ServerResult.success(properties);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<ServerResult<PropertyDetailsModel?>> getPropertyByUnitId(
      {String? unitId}) {
    throw UnimplementedError();
  }

  @override
  Future<ServerResult<List<UnitRequestModel>>> getUnits() async {
    try {
      final unitsData = await supabase.from('units').select();
      final units = unitsData
          .map<UnitRequestModel>((json) => UnitRequestModel.fromJson(json))
          .toList();
      return ServerResult.success(units);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<List<PropertyDetailsModel>> searchProperties(
      {String? searchQuery,
      double? minPrice,
      double? maxPrice,
      int? numberOfRooms,
      int? numberOfBathrooms,
      String? location,
      String? saleType,
      int? minArea,
      int? maxArea}) async {
    var query =
        supabase.from('property').select('''*, property_images(image_url),
      property_features(feature),
      developers(*)
    ''');
    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query.or(
        'property_name.ilike.%$searchQuery%,'
        'description.ilike.%$searchQuery%,'
        'location.ilike.%$searchQuery%',
      );
    }

    if (minPrice != null) {
      query = query.gte('price', minPrice);
    }
    if (maxPrice != null) {
      query = query.lte('price', maxPrice);
    }
    if (numberOfRooms != null) {
      query = query.eq('number_of_rooms', numberOfRooms);
    }

    if (numberOfBathrooms != null) {
      query = query.eq('number_of_bathrooms', numberOfBathrooms);
    }
    if (location != null && location.isNotEmpty) {
      query = query.ilike('location', '%$location%');
    }

    if (saleType != null && saleType.isNotEmpty) {
      query = query.eq('sale_type', saleType);
    }

    if (minArea != null) {
      query = query.gte('area', minArea);
    }
    if (maxArea != null) {
      query = query.lte('area', maxArea);
    }

    final response = await query;

    final properties = response
        .map<PropertyDetailsModel>(
            (property) => PropertyDetailsModel.fromJson(property))
        .toList();
    return properties;
  }

  @override
  Future<List<PropertyDetailsModel>> searchPropertiesNearLocation(
      {required double latitude,
      required double longitude,
      double? radiusInKm}) {
    // TODO: implement searchPropertiesNearLocation
    throw UnimplementedError();
  }
}
