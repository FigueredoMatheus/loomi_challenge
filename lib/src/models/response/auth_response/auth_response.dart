import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class AuthResponse {
  final bool success;
  final DioExceptionModel? exception;
  final UserCredential? userCredential;

  AuthResponse({
    required this.success,
    this.exception,
    this.userCredential,
  });

  AuthResponse.firebaseSuccess(this.userCredential)
      : success = true,
        exception = null;

  AuthResponse.apiSuccess()
      : success = true,
        exception = null,
        userCredential = null;

  AuthResponse.fail(this.exception)
      : success = false,
        userCredential = null;
}
