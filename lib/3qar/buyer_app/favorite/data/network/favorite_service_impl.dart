import 'package:aqar/3qar/buyer_app/favorite/data/model/favorite_model.dart';
import 'package:aqar/3qar/buyer_app/favorite/data/network/favorite_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/utils/favorites_exception.dart';

class FavoriteServiceImpl implements FavoriteService {
  final supabase = Supabase.instance.client;

  @override
  Future<List<FavoriteModel>> fetchFavoritesProperteis() async {
    try {
      final result = await supabase.from('favorites').select();
      final favoriteProperties = result
          .map<FavoriteModel>((favorite) => FavoriteModel.fromJson(favorite))
          .toList();
      return favoriteProperties;
    } catch (error) {
      throw FavoriteServiceException(error.toString());
    }
  }

  @override
  Future<int> insertFavoriteProperty(propertyId) async {
    try {
      final currentUserId = supabase.auth.currentUser?.id;
      if (currentUserId == null) throw Exception('User not authenticated');
      await supabase
          .from('favorites')
          .insert(FavoriteModel(propertyId: propertyId, userId: currentUserId));
      return propertyId;
    } catch (error) {
      throw FavoriteServiceException(error.toString());
    }
  }

  @override
  Future<int> removeFavoriteProperty(propertyId) async {
    try {
      final currentUserId = supabase.auth.currentUser?.id;
      if (currentUserId == null) throw Exception('User not authenticated');

      await supabase
          .from('favorites')
          .delete()
          .eq('user_id', currentUserId)
          .eq('property_id', propertyId);
      return propertyId;
    } catch (error) {
      throw FavoriteServiceException(error.toString());
    }
  }
}
