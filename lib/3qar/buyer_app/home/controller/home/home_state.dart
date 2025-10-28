import 'package:aqar/3qar/buyer_app/home/data/model/home_enum.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/unit_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/property_details_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeDataState.loading) HomeDataState propertyStatus,
    @Default(HomeDataState.loading) HomeDataState unitsStatus,
    PageViewState? pageChanged,
    @Default(0) int currentIndex,
    @Default([]) List<UnitRequestModel> unitsData,
    @Default([]) List<PropertyDetailsModel> propertiesData,
    String? errorMessage,
  }) = _HomeState;
}
