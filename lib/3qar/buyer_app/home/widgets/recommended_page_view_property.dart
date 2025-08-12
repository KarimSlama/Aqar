import 'package:aqar/3qar/buyer_app/home/controller/home_cubit.dart';
import 'package:aqar/core/common/widgets/loaders/recommended_property_shimmer.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/home_state.dart';
import '../data/model/home_enum.dart';
import 'property_card.dart';

class RecommendedPageViewProperty extends StatelessWidget {
  const RecommendedPageViewProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.propertyStatus) {
          case HomeDataState.loading:
            return RecommendedPropertyShimmer();
          case HomeDataState.success:
            final sortedProperties = List.from(state.propertiesData)
              ..sort((a, b) => a.price.compareTo(b.price));

            final limitedProperties = sortedProperties.take(5).toList();
            return SizedBox(
              height: AqarHelperFunctions.screenHeight(context) / 2.8,
              child: PageView(
                controller: context.read<HomeCubit>().pageController,
                onPageChanged: (index) =>
                    context.read<HomeCubit>().changePageViewPage(index),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  limitedProperties.length,
                  (index) {
                    final property = limitedProperties[index];
                    return PropertyCard(property: property);
                  },
                ),
              ),
            );
          case HomeDataState.error:
            return Text(state.errorMessage ?? 'Error units');
        }
      },
    );
  }
}
