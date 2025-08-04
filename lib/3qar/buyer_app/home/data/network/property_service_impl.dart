import 'package:aqar/3qar/buyer_app/home/data/model/property_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/developer_request_model.dart';

class PropertyServiceImpl implements PropertyService {
  final supabase = Supabase.instance.client;

  @override
  Future<ServerResult<List<PropertyRequestModel>>> getProperties() async {
    return _fetchPropertiesWithDetails();
  }

  @override
  Future<ServerResult<PropertyRequestModel?>> getPropertyByUnitId(
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

  Future<ServerResult<List<PropertyRequestModel>>> _fetchPropertiesWithDetails({
    void Function(PostgrestFilterBuilder<List<Map<String, dynamic>>> query)?
        queryBuilder,
  }) async {
    try {
      var query = supabase.from('property').select('''
      *,
      property_images(image_url),
      property_features(feature),
      developers(*)
    ''');

      if (queryBuilder != null) {
        queryBuilder(query);
      }

      final response = await query;

      final properties = response.map<PropertyRequestModel>((prop) {
        final imagesData = (prop['property_images'] as List<dynamic>?) ?? [];
        final featuresData =
            (prop['property_features'] as List<dynamic>?) ?? [];

        final developersData = prop['developers'] as Map<String, dynamic>?;

        return PropertyRequestModel(
          id: prop['id'],
          propertyName: prop['property_name'],
          description: prop['description'],
          location: prop['location'],
          createdAt: prop['created_at'],
          price: (prop['price'] as num).toDouble(),
          imageUrls: imagesData
              .map<String>((img) => img['image_url'] as String)
              .toList(),
          features:
              featuresData.map<String>((f) => f['feature'] as String).toList(),
          area: prop['area'],
          numberOfBathrooms: prop['number_of_bathrooms'],
          numberOfBeds: prop['number_of_beds'],
          unitId: prop['unit_id'],
          numberOfRooms: prop['number_of_rooms'],
          developer: developersData != null
              ? DeveloperRequestModel.fromJson(developersData)
              : null,
        );
      }).toList();

      return ServerResult.success(properties);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
