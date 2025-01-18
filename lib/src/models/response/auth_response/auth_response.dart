import 'package:firebase_auth/firebase_auth.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class AuthResponse {
  final bool success;
  final ExceptionModel? exception;
  final UserCredential? firebaseUserCredential;

  AuthResponse({
    required this.success,
    this.exception,
    this.firebaseUserCredential,
  });

  AuthResponse.firebaseSuccess(this.firebaseUserCredential)
      : success = true,
        exception = null;

  AuthResponse.apiSuccess()
      : success = true,
        exception = null,
        firebaseUserCredential = null;

  AuthResponse.fail(this.exception)
      : success = false,
        firebaseUserCredential = null;
}
