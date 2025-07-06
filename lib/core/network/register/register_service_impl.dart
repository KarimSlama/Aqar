import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterServiceImpl implements RegisterService {
  final supabase = Supabase.instance.client;

  @override
  Future<ServerResult<String?>> login(LoginRequestBody loginRequestBody) async {
    try {
      final result = await supabase.auth.signInWithPassword(
        email: loginRequestBody.email,
        password: loginRequestBody.password,
      );
      return ServerResult.success(result.user!.id);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
