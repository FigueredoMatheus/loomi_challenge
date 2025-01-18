import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class UserServicesResponse {
  final bool success;
  final ExceptionModel? exception;

  UserServicesResponse({
    required this.success,
    this.exception,
  });

  UserServicesResponse.success()
      : success = true,
        exception = null;

  UserServicesResponse.fail(this.exception) : success = false;
}
