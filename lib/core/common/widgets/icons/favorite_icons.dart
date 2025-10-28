import 'package:aqar/3qar/buyer_app/favorite/controller.dart/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../3qar/buyer_app/favorite/controller.dart/cubit/favorites_state.dart';
import '../../../constants/aqar_colors.dart';
import '../circulars/circular_container.dart';

class FavoriteIcon extends StatelessWidget {
  final int propertyId;
  final VoidCallback? onTap;
  const FavoriteIcon({super.key, required this.propertyId, this.onTap});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoritesCubit>();
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final isFavorite = state.maybeWhen(
          success: (favorites) =>
              favorites.any((favorite) => favorite.propertyId == propertyId),
          orElse: () => false,
        );
        return GestureDetector(
          onTap: onTap ??
              () {
                if (isFavorite) {
                  favoriteCubit.removeFavoriteProperty(propertyId);
                } else {
                  favoriteCubit.insertFavoriteProperty(propertyId);
                }
              },
          child: CircularContainer(
            width: 35,
            height: 35,
            color: AqarColors.white,
            child: Icon(isFavorite ? Iconsax.heart : Iconsax.heart_copy,
                color: isFavorite ? AqarColors.red : AqarColors.black),
          ),
        );
      },
    );
  }
}
