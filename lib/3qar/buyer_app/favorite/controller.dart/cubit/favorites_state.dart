import 'package:aqar/3qar/buyer_app/favorite/data/model/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.success(
      {required List<FavoriteModel> favorites}) = Success;
  const factory FavoritesState.error({required String error}) = Error;
}
