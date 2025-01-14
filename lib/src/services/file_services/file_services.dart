import 'package:loomi_challenge/src/models/response/file_services_response/file_services_response.dart';
import 'package:loomi_challenge/src/repositories/file_repository/file_repository.dart';
import 'package:loomi_challenge/src/services/file_services/file_services_impl.dart';

class FileServices extends FileServicesImpl {
  final _repository = FileRepository();

  @override
  Future<FileServicesResponse> downloadFile(String url, String savePath) =>
      _repository.downloadFile(url, savePath);
}
