import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:aqar/core/network/users/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserServiceImpl implements UserService {
  final supabase = Supabase.instance.client;

  @override
  Future<ServerResult<void>> createUser(UserModel userModel) async {
    try {
      final result = await supabase.from('profiles').insert(userModel.toJson());
      return ServerResult.success(result);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
