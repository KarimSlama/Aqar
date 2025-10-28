import 'dart:io';

import 'package:aqar/3qar/buyer_app/profile/data/model/seller_rating_model.dart';
import 'package:aqar/3qar/buyer_app/profile/data/network/profile_service.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileServiceImpl implements ProfileService {
  final supabase = Supabase.instance.client;
  @override
  Future<UserModel> fetchProfileData() async {
    final userId = supabase.auth.currentUser?.id;
    try {
      if (userId == null) {
        throw Exception('User is not authenticated');
      }

      final response =
          await supabase.from('profiles').select().eq('id', userId);

      if (response.isEmpty) {
        throw Exception('Profile not found for user ID: $userId');
      }

      final profile = response.first;

      return UserModel.fromJson(profile);
    } catch (error) {
      throw Exception('error with impl fetch $error');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (error) {
      throw Exception('error with impl logout $error');
    }
  }

  @override
  Future<List<SellerRatingModel>> fetchSellerRating(String sellerId) async {
    try {
      final response = await supabase
          .from('seller_ratings')
          .select('*, profiles!seller_ratings_buyer_id_fkey(*)')
          .eq('seller_id', sellerId);

      if (response.isEmpty) {
        return [];
      }

      final ratingsData =
          response.map((rating) => SellerRatingModel.fromJson(rating)).toList();

      return ratingsData;
    } catch (error) {
      throw Exception('error with impl fetchSellerRating $error');
    }
  }

  @override
  Future<UserModel> updateSingleFieldProfileData(
      Map<String, dynamic> json) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User is not authenticated');
      }
      final response = await supabase
          .from('profiles')
          .update(json)
          .eq('id', userId)
          .select();

      if (response.isEmpty) {
        throw Exception('the field is not found for user ID: $userId');
      }

      final updatedProfileMap = response.first;

      return UserModel.fromJson(updatedProfileMap);
    } catch (error) {
      throw Exception('error with impl update single field $error');
    }
  }

  @override
  Future<String> uploadProfileImageToStorage(File imagePath) async {
    try {
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User is not authenticated');
      }

      final imageBytes = await imagePath.readAsBytes();
      final imageExtension = imagePath.path.split('.').last.toLowerCase();

      final uniqueFileName =
          '${DateTime.now().millisecondsSinceEpoch}.$imageExtension';
      final filePath = '$userId/$uniqueFileName';

      await supabase.storage.from('profiles').uploadBinary(filePath, imageBytes,
          fileOptions:
              FileOptions(upsert: true, contentType: 'image/$imageExtension'));

      final imageUrl = supabase.storage.from('profiles').getPublicUrl(filePath);

      return imageUrl;
    } catch (error) {
      throw Exception('Error uploading profile image to storage: $error');
    }
  }
}
