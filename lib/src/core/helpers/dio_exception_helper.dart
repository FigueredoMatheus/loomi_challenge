import 'package:dio/dio.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class DioExceptionHelper {
  ExceptionModel getException(DioException exception) {
    late ExceptionModel exceptionModel;

    if (exception.response?.data != null) {
      final error = exception.response?.data['error'];

      exceptionModel = ExceptionModel.dioException(
        title: error['name'],
        message: error['message'],
        exceptionCode: error['status'].toString(),
      );
    } else {
      switch (exception.type) {
        case DioExceptionType.badResponse:
          exceptionModel = ExceptionModel.dioException(
            title: 'Bad Response Error',
            message: 'Check API url or parameters are invalid',
            exceptionCode: DioExceptionType.badResponse.name,
          );
          break;
        case DioExceptionType.connectionError:
          exceptionModel = ExceptionModel.dioException(
            title: 'Connection Error',
            message: 'Check your connectivity',
            exceptionCode: DioExceptionType.connectionError.name,
          );
          break;
        case DioExceptionType.connectionTimeout:
          exceptionModel = ExceptionModel.dioException(
            title: 'Connection timeout',
            message: 'Check your connectivity',
            exceptionCode: DioExceptionType.connectionTimeout.name,
          );
          break;
        case DioExceptionType.cancel:
          exceptionModel = ExceptionModel.dioException(
            title: 'Request Canceled',
            message: 'Check API url or parameters are invalid',
            exceptionCode: DioExceptionType.cancel.name,
          );
          break;
        case DioExceptionType.receiveTimeout:
          exceptionModel = ExceptionModel.dioException(
            title: 'Receive a Timeout',
            message:
                'Check API url, network connectivity or parameters are invalid',
            exceptionCode: DioExceptionType.receiveTimeout.name,
          );
          break;
        default:
          exceptionModel = ExceptionModel.dioException(
            title: 'Unknown',
            message: '',
            exceptionCode: 'Unknown',
          );
      }
    }

    return exceptionModel;
  }
}
