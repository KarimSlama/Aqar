import 'package:aqar/3qar/buyer_app/home/widgets/recommended_page_view_property.dart';
import 'package:aqar/core/common/widgets/texts/section_heading.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:flutter/material.dart';
import 'widgets/unit_building_list_of_cards.dart';
import 'widgets/categories_list_buttons.dart';
import 'widgets/filter_home_screen_container.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/recommended_for_you_list_of_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(AqarSizes.ms),
          child: Column(
            spacing: AqarSizes.ms,
            children: [
              const FilterHomeSearchContainer(),
              const SizedBox(height: AqarSizes.sm),
              const SectionHeading(
                text: AqarString.recommended,
                isActionButton: false,
              ),
              const RecommendedPageViewProperty(),
              const CategoriesListButtons(),
              const SizedBox(height: AqarSizes.sm),
              SectionHeading(
                  text: AqarString.exploreByLocation, onPressed: () {}),
              const UnitBuildingListOfCards(),
              SectionHeading(
                text: AqarString.recommendedForYou,
                onPressed: () {},
              ),
              const RecommendedForYouListOfCards(),
            ],
          ),
        ),
      ),
    );
  }
}
