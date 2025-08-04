import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:aqar/core/network/users/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user_model.dart';

class SignUpRepository {
  final RegisterService _registerService;
  final UserService _userService;

  const SignUpRepository(this._registerService, this._userService);

  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      final signUpResult = await _registerService.signUp(userModel);

      if (signUpResult is Success<String?>) {
        final userId = signUpResult.data;
        if (userId == null) return ServerResult.failure("User ID is null");

        final updatedUser = userModel.copyWith(id: userId);

        if (Supabase.instance.client.auth.currentUser == null) {
          await _registerService.login(LoginRequestBody(
              email: userModel.email, password: userModel.password!));
        }

        final profileResult = await _userService.createUser(updatedUser);
        if (profileResult is Failure) {
          return ServerResult.failure(
              "Profile insert failed: ${profileResult.error}");
        }

        return ServerResult.success(userId);
      } else {
        return signUpResult;
      }
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
