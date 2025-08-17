import 'package:aqar/3qar/buyer_app/profile/data/model/profile_enum.dart';
import 'package:aqar/3qar/buyer_app/profile/data/model/seller_rating_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../sign_up/data/model/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileDataState.loading) ProfileDataState profileDataStatus,
    @Default(ProfileDataState.loading) ProfileDataState sellerRatingStatus,
    @Default(ProfileUpdateDataState.enabled) ProfileUpdateDataState updated,
    @Default(ProfileUpdateDataState.enabled)
    ProfileUpdateDataState editAboutMeEnabled,
    @Default(UserModel.empty) UserModel userData,
    @Default(false) bool isEnabled,
    @Default([]) List<SellerRatingModel> sellerRatingData,
    String? errorMessage,
  }) = _ProfileState;
}
