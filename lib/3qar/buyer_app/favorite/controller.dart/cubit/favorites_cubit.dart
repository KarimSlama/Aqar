import 'package:aqar/3qar/buyer_app/favorite/data/favorites_repository.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';
import 'package:aqar/3qar/buyer_app/favorite/data/model/favorite_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;

  FavoritesCubit(this.favoritesRepository)
      : super(const FavoritesState.initial()) {
    fetchAllFavorites();
  }

  void fetchAllFavorites() async {
    emit(const FavoritesState.loading());
    final result = await favoritesRepository.fetchFavorites();

    result.when(
      success: (favorites) {
        emit(FavoritesState.success(favorites: favorites));
      },
      failure: (error) {
        emit(FavoritesState.error(error: error));
      },
    );
  }

  List<PropertyDetailsModel> getFavoriteProperties(
      List<PropertyDetailsModel> allProperties) {
    final currentState = state;
    if (currentState is Success) {
      final favoriteIds =
          currentState.favorites.map((fav) => fav.propertyId).toList();

      return allProperties
          .where((property) => favoriteIds.contains(property.id))
          .toList();
    }
    return [];
  }

  void removeFavoriteProperty(int propertyId) async {
    final currentState = state;
    if (currentState is Success) {
      final updatedFavorites = currentState.favorites
          .where((fav) => fav.propertyId != propertyId)
          .toList();
      emit(FavoritesState.success(favorites: updatedFavorites));
    }

    final removedFavoriteResult =
        await favoritesRepository.removeFavoriteProperty(propertyId);
    removedFavoriteResult.when(
      success: (_) {},
      failure: (error) {
        if (currentState is Success) {
          emit(FavoritesState.success(favorites: currentState.favorites));
        }
        emit(FavoritesState.error(error: error));
      },
    );
  }

  void insertFavoriteProperty(int propertyId) async {
    final currentState = state;
    if (currentState is Success) {
      final newFavorite = FavoriteModel(propertyId: propertyId, userId: '');
      final updatedFavorites = [...currentState.favorites, newFavorite];
      emit(FavoritesState.success(favorites: updatedFavorites));
    }

    final insertFavoriteResult =
        await favoritesRepository.insertFavoriteProperty(propertyId);
    insertFavoriteResult.when(
      success: (_) {},
      failure: (error) {
        if (currentState is Success) {
          emit(FavoritesState.success(favorites: currentState.favorites));
        }
        emit(FavoritesState.error(error: error));
      },
    );
  }
}
