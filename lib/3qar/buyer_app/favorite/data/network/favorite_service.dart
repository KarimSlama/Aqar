import 'package:aqar/3qar/buyer_app/favorite/data/model/favorite_model.dart';

abstract class FavoriteService {
  Future<List<FavoriteModel>> fetchFavoritesProperteis();
  Future<int> insertFavoriteProperty(int propertyId);
  Future<int> removeFavoriteProperty(int propertyId);
}
