import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class AuthResponse {
  final bool success;
  final DioExceptionModel? exception;
  final String? firebaseUID;

  AuthResponse({
    required this.success,
    this.exception,
    this.firebaseUID,
  });

  AuthResponse.firebaseSuccess(this.firebaseUID)
      : success = true,
        exception = null;

  AuthResponse.apiSuccess()
      : success = true,
        exception = null,
        firebaseUID = null;

  AuthResponse.fail(this.exception)
      : success = false,
        firebaseUID = null;
}
