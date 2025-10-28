import 'package:aqar/3qar/login/data/models/login_request_body.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/server_result.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterServiceImpl implements RegisterService {
  final supabase = Supabase.instance.client;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId:
        '475893240869-vv9qqvlfp3gr50vcdtlg3ju6ju8ngtr0.apps.googleusercontent.com',
  );

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

  @override
  Future<ServerResult<String?>> signUp(UserModel userModel) async {
    try {
      final result = await supabase.auth.signUp(
        password: userModel.password!,
        email: userModel.email,
      );
      return ServerResult.success(result.user!.id);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }

  @override
  Future<String?> signInWithGoogle() async {
    // 1. Start Google Sign In
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthResponse response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: googleAuth.idToken!,
      accessToken: googleAuth.accessToken,
    );

    final user = response.user;
    if (user == null) {
      throw Exception('Failed to sign in with Google');
    }
    await supabase.from('profiles').upsert({
      'id': user.id,
      'email': user.email,
      'first_name': googleUser.displayName?.split(' ').first ?? '',
      'last_name': googleUser.displayName?.split(' ').skip(1).join(' ') ?? '',
      'image': googleUser.photoUrl,
      'user_type': 'buyer',
    }, onConflict: 'id');

    return user.id;
  }

  @override
  Future<String?> signInWithFacebook() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.facebook,
      redirectTo: 'https://ktbufzscykarhvrrlwzi.supabase.co/auth/v1/callback',
      scopes: 'email,public_profile',
      authScreenLaunchMode: LaunchMode.inAppWebView,
    );

    final user = supabase.auth.currentUser;
    if (user != null) {
      await supabase.from('profiles').upsert({
        'id': user.id,
        'email': user.email,
        'first_name': user.userMetadata?['first_name'] ?? '',
        'last_name': user.userMetadata?['last_name'] ?? '',
        'image': user.userMetadata?['avatar_url'] ?? '',
        'user_type': 'buyer',
      }, onConflict: 'id');

      return user.id;
    }
    return null;
  }

  @override
  Future<ServerResult<void>> sendPasswordResetEmail(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return ServerResult.success(null);
    } catch (error) {
      return ServerResult.failure(error.toString());
    }
  }
}
