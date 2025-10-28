import 'package:aqar/3qar/login/data/models/login_request_body.dart';

import '../../../3qar/sign_up/data/model/user_model.dart';
import '../server_result.dart';

abstract class RegisterService {
  Future<ServerResult<String?>> signUp(UserModel userModel);

  Future<ServerResult<String?>> login(LoginRequestBody loginRequestBody);

  Future<String?> signInWithGoogle();
  Future<String?> signInWithFacebook();

  // Forgot Password
  Future<ServerResult<void>> sendPasswordResetEmail(String email);
}
