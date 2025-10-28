import 'package:aqar/3qar/buyer_app/home/controller/categories/cubit/categories_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home/home_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_bloc.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/category_filtered_properties.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/filter_drawer.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/list_of_searched_properties.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/recommended_page_view_property.dart';
import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_list_buttons.dart';
import 'widgets/filter_home_screen_container.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/recommended_for_you_list_of_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<SearchBloc>()),
        BlocProvider.value(value: getIt<CategoriesCubit>()),
      ],
      child: Scaffold(
        endDrawer: FilterDrawer(),
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(AqarSizes.ms),
            child: Column(
              spacing: AqarSizes.ms,
              children: [
                const FilterHomeSearchContainer(),
                const SizedBox(height: AqarSizes.sm),
                const ListOfSearchedProperties(),
                const SectionHeading(
                  text: AqarString.recommended,
                  isActionButton: false,
                ),
                const RecommendedPageViewProperty(),
                const CategoriesListButtons(),
                const CategoryFilteredProperties(),
                const SizedBox(height: AqarSizes.sm),
                SectionHeading(
                  text: AqarString.recommendedForYou,
                  onPressed: () => context.pushNamed(
                      Routes.recommendedForYouAllPropertiesScreen,
                      arguments: context.read<HomeCubit>().propertiesList),
                ),
                const RecommendedForYouListOfCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
