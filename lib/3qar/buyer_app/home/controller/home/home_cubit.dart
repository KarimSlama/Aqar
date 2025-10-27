import 'dart:async';

import 'package:aqar/3qar/buyer_app/home/controller/home/home_state.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/home_enum.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/properties_repository.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/units_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final PropertiesRepository propertyRepository;
  final UnitsRepository unitsRepository;
  HomeCubit(this.propertyRepository, this.unitsRepository)
      : super(HomeState()) {
    startAutoScroll();
  }

  List<UnitRequestModel> unitsList = [];
  List<PropertyDetailsModel> propertiesList = [];

  final PageController pageController = PageController();
  Timer? timer;
  int currentPage = 0;
  final int totalPages = 5;

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentPage < totalPages - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void changePageViewPage(int index) {
    currentPage = index;
    emit(state.copyWith(
        pageChanged: PageViewState.changed, currentIndex: currentPage));
  }

  void fetchProperties() async {
    final properties = await propertyRepository.fetchProperties();

    properties.when(success: (property) {
      propertiesList = property;
      emit(state.copyWith(
          propertiesData: property, propertyStatus: HomeDataState.success));
    }, failure: (error) {
      emit(state.copyWith(
          errorMessage: error, propertyStatus: HomeDataState.error));
    });
  }

  void fetchUnits() async {
    final units = await unitsRepository.fetchUnits();

    units.when(success: (unit) {
      unitsList = unit;
      emit(state.copyWith(unitsData: unit, unitsStatus: HomeDataState.success));
    }, failure: (error) {
      emit(state.copyWith(
          errorMessage: error, unitsStatus: HomeDataState.error));
    });
  }
}
