class CommentResponse {
  final bool success;
  final String message;
  final dynamic data;

  CommentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  CommentResponse.onSuccess(this.data)
      : success = true,
        message = '';

  CommentResponse.onError(this.data, this.message) : success = false;
}
