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
}
