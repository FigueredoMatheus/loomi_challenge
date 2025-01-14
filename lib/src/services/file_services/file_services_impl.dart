import 'package:loomi_challenge/src/models/response/file_services_response/file_services_response.dart';

abstract class FileServicesImpl {
  Future<FileServicesResponse> downloadFile(String url, String savePath);
}
