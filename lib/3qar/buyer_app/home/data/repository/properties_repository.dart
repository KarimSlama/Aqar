import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/core/network/server_result.dart';

class PropertiesRepository {
  final PropertyService _propertyService;

  PropertiesRepository(this._propertyService);

  Future<ServerResult<List<PropertyDetailsModel>>> fetchProperties() async {
    try {
      return await _propertyService.getProperties();
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<PropertyDetailsModel>>> searchProperties({
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? numberOfRooms,
    int? numberOfBathrooms,
    String? location,
    String? saleType,
    int? minArea,
    int? maxArea,
  }) async {
    try {
      final response = await _propertyService.searchProperties(
        searchQuery: searchQuery,
        minPrice: minPrice,
        maxPrice: maxPrice,
        numberOfRooms: numberOfRooms,
        numberOfBathrooms: numberOfBathrooms,
        location: location,
        saleType: saleType,
        minArea: minArea,
        maxArea: maxArea,
      );
      return ServerResult.success(response);
    } catch (error) {
      print('error with properties repo is ${error.toString()}');
      return ServerResult.failure(error.toString());
    }
  }
}
