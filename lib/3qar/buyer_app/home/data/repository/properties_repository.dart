import 'package:aqar/3qar/buyer_app/home/data/model/property_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/core/network/server_result.dart';

class PropertiesRepository {
  final PropertyService _propertyService;

  PropertiesRepository(this._propertyService);

  Future<ServerResult<List<PropertyRequestModel>>> fetchProperties() async {
    try {
      return await _propertyService.getProperties();
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
