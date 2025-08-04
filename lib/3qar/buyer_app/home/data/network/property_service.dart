import 'package:aqar/3qar/buyer_app/home/data/model/property_request_model.dart';
import 'package:aqar/core/network/server_result.dart';

import '../model/unit_request_model.dart';

abstract class PropertyService {
  Future<ServerResult<List<PropertyRequestModel>>> getProperties();
  Future<ServerResult<List<UnitRequestModel>>> getUnits();
  Future<ServerResult<PropertyRequestModel?>> getPropertyByUnitId(
      {String? unitId});
}
