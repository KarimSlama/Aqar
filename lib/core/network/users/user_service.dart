import '../../../3qar/sign_up/data/model/user_model.dart';
import '../server_result.dart';

abstract class UserService {
  Future<ServerResult<void>> createUser(UserModel userModel);
  String? getCurrentUserId();
}
