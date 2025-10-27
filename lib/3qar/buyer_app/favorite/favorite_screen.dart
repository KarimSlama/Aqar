import 'package:aqar/3qar/buyer_app/favorite/controller.dart/cubit/favorites_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/property_card.dart';
import 'package:aqar/core/common/widgets/app_bar/normal_app_bar.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/controller/home/home_cubit.dart';
import '../home/data/model/property_details_model.dart';
import 'controller.dart/cubit/favorites_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<PropertyDetailsModel> _favoriteProperties;
  late final List<PropertyDetailsModel> _allProperties;

  @override
  void initState() {
    super.initState();
    _allProperties = context.read<HomeCubit>().state.propertiesData;
    _favoriteProperties =
        context.read<FavoritesCubit>().getFavoriteProperties(_allProperties);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAqarAppBar(text: AqarString.favorites),
      body: BlocListener<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          if (state is Success) {
            final newFavorites = context
                .read<FavoritesCubit>()
                .getFavoriteProperties(_allProperties);

            final removedItems = _favoriteProperties
                .where((item) => !newFavorites.contains(item))
                .toList();

            for (var removedItem in removedItems) {
              final removedIndex = _favoriteProperties.indexOf(removedItem);
              if (removedIndex != -1) {
                _favoriteProperties.removeAt(removedIndex);
                _listKey.currentState?.removeItem(
                  removedIndex,
                  (context, animation) =>
                      _buildRemovedItem(removedItem, context, animation),
                  duration: const Duration(milliseconds: 300),
                );
              }
            }

            final addedItems = newFavorites
                .where((item) => !_favoriteProperties.contains(item))
                .toList();

            for (var addedItem in addedItems) {
              _favoriteProperties.add(addedItem);
              _listKey.currentState?.insertItem(_favoriteProperties.length - 1);
            }
          }
        },
        child: _favoriteProperties.isEmpty
            ? const Center(child: Text('No favorites yet!'))
            : AnimatedList(
                key: _listKey,
                initialItemCount: _favoriteProperties.length,
                itemBuilder: (context, index, animation) {
                  final property = _favoriteProperties[index];
                  return SlideTransition(
                    position: animation.drive(Tween(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    )),
                    child: PropertyCard(property: property),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildRemovedItem(PropertyDetailsModel property, BuildContext context,
      Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: PropertyCard(property: property),
      ),
    );
  }
}
