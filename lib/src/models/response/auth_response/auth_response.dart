import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class AuthResponse {
  final bool success;
  final DioExceptionModel? exception;

  AuthResponse({
    required this.success,
    this.exception,
  });

  AuthResponse.success()
      : success = true,
        exception = null;

  AuthResponse.fail(this.exception) : success = false;
}
