import 'package:freezed_annotation/freezed_annotation.dart';

part 'buyer_navigation_state.freezed.dart';

@freezed
class BuyerNavigationState<T> with _$BuyerNavigationState<T> {
  const factory BuyerNavigationState.initial() = _Initial;
  const factory BuyerNavigationState.navigationChanged(int index) =
      NavigationChanged;
}
