import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:aqar/core/network/users/user_service.dart';

import '../model/user_model.dart';

class SignUpRepository {
  final RegisterService _registerService;
  final UserService _userService;

  const SignUpRepository(this._registerService, this._userService);

  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      final result = await _registerService.signUp(userModel);
      var userId;
      result.when(success: (id) {
        print('id with success is $id');
        userId = userModel.copyWith(id: id);
      }, failure: (failure) {
        print('error with failure repo is $failure');
      });
      if (userId != null) {
        await _userService.createUser(userId);
      }
      return result;
    } catch (error) {
      print('error with catch repo is $error');
      return ServerResult.failure(error.toString());
    }
  }
}
