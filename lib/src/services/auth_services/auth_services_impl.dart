abstract class AuthServicesImpl {
  signInUserService(Map<String, dynamic> credentials);
  signUpAccountService(Map<String, dynamic> data);
  forgotUserPasswordService(Map<String, dynamic> data);
  Future<bool> changeUserPasswordService(Map<String, dynamic> data);
  googleSignInService();
}
