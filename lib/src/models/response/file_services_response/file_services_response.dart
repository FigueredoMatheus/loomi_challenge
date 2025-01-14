class FileServicesResponse {
  final bool success;
  final String filePath;
  String? errorMessage;

  FileServicesResponse({
    required this.success,
    required this.filePath,
    required this.errorMessage,
  });

  FileServicesResponse.onSuccess(this.filePath) : success = true;

  FileServicesResponse.onError(this.errorMessage)
      : success = false,
        filePath = '';
}
