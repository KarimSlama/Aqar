import 'package:aqar/3qar/buyer_app/profile/data/model/seller_rating_model.dart';
import 'package:aqar/3qar/buyer_app/profile/data/network/profile_service.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/core/network/server_result.dart';

class ProfileRepository {
  final ProfileService profileService;
  const ProfileRepository(this.profileService);

  Future<ServerResult<UserModel>> fetchProfileData() async {
    try {
      final profile = await profileService.fetchProfileData();
      return ServerResult.success(profile);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<List<SellerRatingModel>>> fetchSellerRating(
      String sellerId) async {
    try {
      final sellerRating = await profileService.fetchSellerRating(sellerId);
      return ServerResult.success(sellerRating);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<UserModel>> updateSingleFieldProfileData(
      Map<String, dynamic> json) async {
    try {
      final field = await profileService.updateSingleFieldProfileData(json);
      return ServerResult.success(field);
    } catch (error) {
      print('error with update singl efield  $error');
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<String>> logout() async {
    try {
      await profileService.logout();
      return const ServerResult.success('ok');
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
