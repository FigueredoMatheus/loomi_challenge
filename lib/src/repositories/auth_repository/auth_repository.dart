import 'package:firebase_auth/firebase_auth.dart';

part 'create_account_email_pass.dart';
part 'login_use_email_pass.dart';

class AuthRepository {
  Future<Map<String, dynamic>> createUserEmailPass({
    required String email,
    required String password,
  }) async =>
      implCreateUserEmailPass(email: email, password: password);

  Future<Map<String, dynamic>> loginUserEmailPass({
    required String email,
    required String password,
  }) async =>
      implLoginUserEmailPass(email: email, password: password);
}
