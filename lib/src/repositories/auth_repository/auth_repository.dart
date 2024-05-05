import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';

part 'create_account_email_pass.dart';
part 'login_use_email_pass.dart';
part 'send_password_reset_email.dart';

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

  Future<Map<String, dynamic>> sendPasswordResetEmail({
    required String email,
  }) async =>
      implSendPasswordResetEmail(email: email);
}
