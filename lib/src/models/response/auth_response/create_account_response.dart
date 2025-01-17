import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class CreateAccountResponse {
  final bool success;
  final DioExceptionModel? exceptionModel;

  CreateAccountResponse({
    required this.success,
    this.exceptionModel,
  });

  CreateAccountResponse.success()
      : success = true,
        exceptionModel = null;

  CreateAccountResponse.fail(this.exceptionModel) : success = false;
}
