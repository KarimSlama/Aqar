import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/core/network/server_result.dart';

import '../model/unit_request_model.dart';

abstract class PropertyService {
  Future<ServerResult<List<PropertyDetailsModel>>> getProperties();
  Future<ServerResult<List<UnitRequestModel>>> getUnits();
  Future<ServerResult<PropertyDetailsModel?>> getPropertyByUnitId(
      {String? unitId});

  Future<List<PropertyDetailsModel>> searchProperties({
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? numberOfRooms,
    int? numberOfBathrooms,
    String? location,
    String? saleType,
    int? minArea,
    int? maxArea,
  });

  Future<List<PropertyDetailsModel>>
      searchPropertiesNearLocation({
    required double latitude,
    required double longitude,
    double? radiusInKm,
  });
}
