import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';

class CommentRepository {
  Future<Map<String, dynamic>> getMovieComments(int movieId) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('movie-comments')
          .doc('movie-$movieId')
          .collection('comments')
          .get();

      final docs = response.docs;
      final List<CommentResponse> commentsResponse = [];

      commentsResponse.addAll(
        docs
            .map((doc) => CommentResponse.fromJson({'data': doc.data()}))
            .toList(),
      );

      commentsResponse
          .sort((a, b) => b.comment.createAt.compareTo(a.comment.createAt));

      return {
        'success': true,
        'comments_response': commentsResponse,
      };
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      return {
        'success': false,
        'message': 'Fail on get comments data\n$exceptionMessage',
      };
    }
  }
}
