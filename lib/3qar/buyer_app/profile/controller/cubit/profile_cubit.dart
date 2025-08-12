import 'package:aqar/3qar/buyer_app/profile/data/model/profile_enum.dart';
import 'package:aqar/3qar/buyer_app/profile/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileState());

  final aboutMeController = TextEditingController();
  bool isEnabled = false;

  void editAboutMe() {
    isEnabled = !isEnabled;
    emit(state.copyWith(
      editAboutMeEnabled: ProfileUpdateDataState.enabled,
      isEnabled: isEnabled,
    ));
  }

  void fetchProfileData() async {
    final profile = await profileRepository.fetchProfileData();

    profile.when(
      success: (profile) {
        aboutMeController.text = profile.aboutMe ?? 'no about me found';
        emit(state.copyWith(
          profileDataStatus: ProfileDataState.success,
          userData: profile,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
            errorMessage: error, profileDataStatus: ProfileDataState.error));
      },
    );
  }

  Future<void> updateSingleFieldData() async {
    final profile = await profileRepository.updateSingleFieldProfileData(
        {'about_me': aboutMeController.text.trim()});

    profile.when(
      success: (profile) {
        emit(state.copyWith(
          profileDataStatus: ProfileDataState.success,
          userData: profile,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
            errorMessage: error, profileDataStatus: ProfileDataState.error));
      },
    );
  }

  void fetchSellerRating(sellerId) async {
    final sellerRating = await profileRepository.fetchSellerRating(sellerId);

    sellerRating.when(
      success: (rating) {
        emit(state.copyWith(
          sellerRatingStatus: ProfileDataState.success,
          sellerRatingData: rating,
        ));
      },
      failure: (error) {
        emit(state.copyWith(
            errorMessage: error, sellerRatingStatus: ProfileDataState.error));
      },
    );
  }

  Future<void> logout() async {
    final result = await profileRepository.logout();
    result.when(
      success: (_) {},
      failure: (error) {
        emit(state.copyWith(
            errorMessage: error, profileDataStatus: ProfileDataState.error));
      },
    );
  }
}
