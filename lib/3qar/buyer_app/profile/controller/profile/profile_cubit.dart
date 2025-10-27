import 'dart:io';

import 'package:aqar/3qar/buyer_app/profile/data/model/profile_enum.dart';
import 'package:aqar/3qar/buyer_app/profile/data/repository/profile_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../sign_up/data/model/user_model.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileState());

  final aboutMeController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  bool isEnabled = false;

  void changeEnabledState() {
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
        initializeFields(profile);

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

  void initializeFields(profile) {
    aboutMeController.text = profile.aboutMe ?? 'no about me found';
    firstNameController.text = profile.firstName;
    lastNameController.text = profile.lastName;
    phoneController.text = profile.phone;
  }

  Future<void> updateSingleFieldData() async {
    final profile = await profileRepository.updateSingleFieldProfileData({
      'about_me': aboutMeController.text.trim(),
      'first_name': firstNameController.text.trim(),
      'last_name': lastNameController.text.trim(),
      'phone': phoneController.text.trimRight(),
    });

    profile.when(
      success: (profile) {
        emit(state.copyWith(
          updated: ProfileUpdateDataState.updated,
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

  Future<void> updateUserProfilePicture() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) {
      return;
    }

    emit(state.copyWith(profileDataStatus: ProfileDataState.loading));

    File file = File(result.files.single.path!);

    final uploadResult =
        await profileRepository.uploadProfileImageToStorage(file);

    String? imageUrl;
    uploadResult.when(
      success: (url) => imageUrl = url,
      failure: (error) {
        throw Exception(error);
      },
    );

    if (imageUrl == null) {
      throw Exception('Failed to get image URL after upload');
    }

    final updateResult = await profileRepository.updateSingleFieldProfileData({
      'image': imageUrl,
    });

    UserModel? updatedProfile;
    updateResult.when(
      success: (profile) => updatedProfile = profile,
      failure: (error) {
        throw Exception(error);
      },
    );

    if (updatedProfile == null) {
      throw Exception('Failed to update user profile with new image URL');
    }

    emit(state.copyWith(
      userData: updatedProfile!,
      profileDataStatus: ProfileDataState.success,
      updated: ProfileUpdateDataState.updated,
    ));
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
