import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/core/network/server_result.dart';

class UnitsRepository {
  final PropertyService _propertyService;

  const UnitsRepository(this._propertyService);

  Future<ServerResult<List<UnitRequestModel>>> fetchUnits() async {
    try {
      final units = await _propertyService.getUnits();
      return units;
    } catch (error) {
      print('error with unit repo is $error');
      return ServerResult.failure(error.toString());
    }
  }
}
