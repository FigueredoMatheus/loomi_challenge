import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/helpers/dio_exception_helper.dart';
import 'package:loomi_challenge/src/models/response/file_services_response/file_services_response.dart';
import 'package:path_provider/path_provider.dart';

class FileRepository {
  RxString progressDownload = '0%'.obs;

  Future<FileServicesResponse> downloadFile(
    String url,
    String fileNameWithExtension,
  ) async {
    try {
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/$fileNameWithExtension';

      final response = await Dio().download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progressDownload.value =
                (received / total * 100).toStringAsFixed(0) + "%";
          }
        },
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: true,
            validateStatus: (status) {
              return status! < 500;
            }),
      );

      if (response.statusCode == 200) {
        return FileServicesResponse.onSuccess(filePath);
      } else {
        return FileServicesResponse.onError(
          'Failed to download video\nCode: ${response.statusCode}',
        );
      }
    } on DioException catch (exception) {
      final exceptionModel = DioExceptionHelper().getException(exception);

      return FileServicesResponse.onError(
          'Failed to download video: ${exceptionModel.message}');
    }
  }
}
