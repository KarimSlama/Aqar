import 'package:aqar/3qar/buyer_app/favorite/data/model/favorite_model.dart';
import 'package:aqar/3qar/buyer_app/favorite/data/network/favorite_service.dart';
import 'package:aqar/core/network/server_result.dart';

class FavoritesRepository {
  final FavoriteService favoriteService;

  FavoritesRepository(this.favoriteService);

  Future<ServerResult<List<FavoriteModel>>> fetchFavorites() async {
    try {
      final favorites = await favoriteService.fetchFavoritesProperteis();
      return ServerResult.success(favorites);
    } catch (error) {
      print('error with repo $error');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<int>> removeFavoriteProperty(propertyId) async {
    try {
      final favorite = await favoriteService.removeFavoriteProperty(propertyId);
      return ServerResult.success(favorite);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<int>> insertFavoriteProperty(propertyId) async {
    try {
      final favorite = await favoriteService.insertFavoriteProperty(propertyId);
      return ServerResult.success(favorite);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
