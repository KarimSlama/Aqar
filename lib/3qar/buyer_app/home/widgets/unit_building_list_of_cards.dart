import 'package:animate_do/animate_do.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home/home_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/unit_building_card_item.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loaders/properties_shimmer_loading.dart';
import '../controller/home/home_state.dart';
import '../data/model/home_enum.dart';

class UnitBuildingListOfCards extends StatelessWidget {
  final int? maxItems;
  const UnitBuildingListOfCards({super.key, this.maxItems = 3});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.unitsStatus != current.unitsStatus,
      builder: (context, state) {
        switch (state.unitsStatus) {
          case HomeDataState.loading:
            return PropertiesShimmerLoading();
          case HomeDataState.success:
            return SizedBox(
              height: AqarHelperFunctions.screenHeight(context) / 4,
              child: FadeIn(
                curve: Curves.bounceInOut,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return UnitBuildingCardItem(unit: state.unitsData[index]);
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
