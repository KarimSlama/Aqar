import 'package:animate_do/animate_do.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home_state.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/home_enum.dart';
import 'package:aqar/core/common/widgets/loaders/recommended_property_shimmer.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'recommended_for_you_item_card.dart';

class RecommendedForYouListOfCards extends StatelessWidget {
  const RecommendedForYouListOfCards({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.propertyStatus != current.propertyStatus,
      builder: (context, state) {
        switch (state.propertyStatus) {
          case HomeDataState.loading:
            return RecommendedPropertyShimmer();
          case HomeDataState.success:
            final sortedProperties = List.from(state.propertiesData)
              ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

            final limitedProperties = sortedProperties.take(3).toList();
            return SizedBox(
              height: AqarHelperFunctions.screenHeight(context) / 4,
              child: FadeIn(
                curve: Curves.bounceInOut,
                child: ListView.builder(
                  itemCount: limitedProperties.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => RecommendedForYouItemCard(
                      property: limitedProperties[index], index: index),
                ),
              ),
            );
          case HomeDataState.error:
            return Text(state.errorMessage ?? 'Error recommended list card');
        }
      },
    );
  }
}
