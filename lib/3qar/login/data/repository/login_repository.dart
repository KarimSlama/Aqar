import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';

class LoginRepository {
  final RegisterService _registerService;

  LoginRepository(this._registerService);

  Future<ServerResult<String?>> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _registerService.login(loginRequestBody);
      return response;
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<String?>> signInWithGoogle() async {
    try {
      final response = await _registerService.signInWithGoogle();
      if (response == null || response.isEmpty) {
        return ServerResult.failure('Google sign-in was cancelled or failed.');
      }
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<String?>> signInWithFacebook() async {
    try {
      final response = await _registerService.signInWithFacebook();
      if (response == null || response.isEmpty) {
        return ServerResult.failure(
            'Facebook sign-in was cancelled or failed.');
      }
      return ServerResult.success(response);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      final result = await _registerService.sendPasswordResetEmail(email);
      return result;
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
