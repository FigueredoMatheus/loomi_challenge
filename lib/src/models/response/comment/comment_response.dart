class CommentResponse {
  final bool success;
  final String message;
  final dynamic data;

  CommentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CommentResponse.onSuccess(dynamic data) {
    return CommentResponse(
      success: true,
      message: '',
      data: data,
    );
  }

  factory CommentResponse.onError(dynamic data, String message) {
    return CommentResponse(
      success: false,
      message: message,
      data: data,
    );
  }
}
