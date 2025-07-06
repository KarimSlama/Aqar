import 'package:aqar/3qar/login/data/models/login_request_body.dart';

import '../server_result.dart';

abstract class RegisterService {
  // Future<ServerResult<String?>> signUp(UserModel userModel);

  Future<ServerResult<String?>> login(LoginRequestBody loginRequestBody);

  // Future<ServerResult<void>> sendPasswordResetEmail(String email);

  // Future<void> signOut();
}
