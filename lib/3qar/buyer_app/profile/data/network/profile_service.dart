import 'dart:io';

import 'package:aqar/3qar/sign_up/data/model/user_model.dart';

import '../model/seller_rating_model.dart';

abstract class ProfileService {
  Future<UserModel> fetchProfileData();
  Future<UserModel> updateSingleFieldProfileData(Map<String, dynamic> json);
  Future<String> uploadProfileImageToStorage(File path);
  Future<List<SellerRatingModel>> fetchSellerRating(String sellerId);
  Future<void> logout();
}
