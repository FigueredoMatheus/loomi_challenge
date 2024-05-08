import 'package:dio/dio.dart';
import 'package:loomi_challenge/src/models/dio_exception_model.dart';

class DioExceptionHelper {
  DioExceptionModel getException(DioExceptionType exception) {
    late DioExceptionModel exceptionModel;

    switch (exception) {
      case DioExceptionType.badResponse:
        exceptionModel = DioExceptionModel(
          title: 'Bad Response Error',
          message: 'Check API url or parameters are invalid',
        );
        break;
      case DioExceptionType.connectionError:
        exceptionModel = DioExceptionModel(
          title: 'Connection Error',
          message: 'Check your connectivity',
        );
        break;
      case DioExceptionType.connectionTimeout:
        exceptionModel = DioExceptionModel(
          title: 'Connection timeout',
          message: 'Check your connectivity',
        );
        break;
      case DioExceptionType.cancel:
        exceptionModel = DioExceptionModel(
          title: 'Request Canceled',
          message: 'Check API url or parameters are invalid',
        );
        break;
      case DioExceptionType.receiveTimeout:
        exceptionModel = DioExceptionModel(
          title: 'Receive a Timeout',
          message:
              'Check API url, network connectivity or parameters are invalid',
        );
        break;
      default:
        exceptionModel = DioExceptionModel(
          title: 'Unknown',
          message: '',
        );
    }
    return exceptionModel;
  }
}
