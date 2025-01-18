import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class ExceptionModel {
  final String title;
  final String message;
  final ExceptionType exceptionType;
  final String exceptionCode;

  bool get isUnauthorized => exceptionCode == '401';

  ExceptionModel.firebaseException(
      {required this.message, required this.exceptionCode})
      : title = 'Firebase Exception',
        exceptionType = ExceptionType.Firebase;

  ExceptionModel.dioException(
      {required this.title, required this.message, required this.exceptionCode})
      : exceptionType = ExceptionType.Dio;
}
