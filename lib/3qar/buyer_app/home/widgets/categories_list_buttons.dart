import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/aqar_sizes.dart';
import '../../../../core/constants/aqar_string.dart';
import '../../../../gen/assets.gen.dart';
import '../controller/categories/cubit/categories_cubit.dart';
import '../controller/categories/cubit/categories_state.dart';
import 'categories_item_buttons.dart';

class CategoriesListButtons extends StatelessWidget {
  const CategoriesListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonsText = [
      AqarString.nearby,
      AqarString.forSale,
      AqarString.forRent,
    ];

    final List<Widget> buttonsIcon = [
      SvgPicture.asset(Assets.icons.nearby),
      SvgPicture.asset(Assets.icons.rent),
      SvgPicture.asset(Assets.icons.coupon),
    ];

    final List<CategoryType> categories = [
      CategoryType.nearby,
      CategoryType.forSale,
      CategoryType.forRent,
    ];

    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        CategoryType? selectedCategory;
        if (state is CategoriesLoaded) {
          selectedCategory = state.selectedCategory;
        }

        return SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category;

              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    context.read<CategoriesCubit>().clearSelection();
                  } else {
                    context.read<CategoriesCubit>().selectCategory(category);
                  }
                },
                child: CategoriesItemButtons(
                  isSelected: isSelected,
                  icon: buttonsIcon[index],
                  text: buttonsText[index],
                ),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: AqarSizes.ms),
            itemCount: 3,
          ),
        );
      },
    );
  }
}
