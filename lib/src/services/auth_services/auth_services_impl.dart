import 'package:loomi_challenge/src/models/response/auth_response/auth_response.dart';

abstract class AuthServicesImpl {
  signInUserService(Map<String, dynamic> credentials);
  signUpAccountService(Map<String, dynamic> data);
  forgotUserPasswordService(Map<String, dynamic> data);
  Future<AuthResponse> changeUserPasswordService(Map<String, dynamic> data);
  googleSignInService();
}
