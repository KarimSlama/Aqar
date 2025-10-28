import 'package:aqar/3qar/buyer_app/home/controller/categories/cubit/categories_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/categories/cubit/categories_state.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/property_card.dart';
import 'package:aqar/3qar/buyer_app/property_details/data/model/property_args.dart';
import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryFilteredProperties extends StatelessWidget {
  const CategoryFilteredProperties({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is! CategoriesLoaded) {
          if (state is CategoriesLoading) {
            return const Padding(
              padding: EdgeInsets.all(AqarSizes.md),
              child: Center(
                child: SpinKitSpinningLines(color: AqarColors.gold),
              ),
            );
          }
          return const SizedBox.shrink();
        }

        final properties = state.getCurrentCategoryProperties();

        if (properties.isEmpty) {
          return const SizedBox.shrink();
        }

        final categoryTitle = _getCategoryTitle(state.selectedCategory);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              text: categoryTitle,
              onPressed: () =>
                  _navigateToSeeAll(context, state.selectedCategory),
            ),
            const SizedBox(height: AqarSizes.sm),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  final property = properties[index];
                  return GestureDetector(
                    onTap: () => context.pushNamed(
                      Routes.propertyDetailsScreen,
                      arguments: PropertyArgs(
                        property: property,
                        imageTag: 'category_property_${property.id}',
                      ),
                    ),
                    child: Container(
                      width: 270.w,
                      margin:
                          const EdgeInsetsDirectional.only(end: AqarSizes.ms),
                      child: PropertyCard(
                        property: property,
                        isCompactMode: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String _getCategoryTitle(CategoryType category) {
    switch (category) {
      case CategoryType.forSale:
        return AqarString.forSale;
      case CategoryType.forRent:
        return AqarString.forRent;
      case CategoryType.nearby:
        return AqarString.nearby;
    }
  }

  void _navigateToSeeAll(BuildContext context, CategoryType category) async {
    final cubit = context.read<CategoriesCubit>();
    final allProperties = await cubit.getAllPropertiesForCategory(category);

    if (context.mounted) {
      context.pushNamed(
        Routes.recommendedForYouAllPropertiesScreen,
        arguments: allProperties,
      );
    }
  }
}
