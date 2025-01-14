import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';

class CommentRepository {
  final commentCollection = 'movie-comments';

  Future<CommentResponse> getMovieComments(int movieId) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(commentCollection)
          .doc('movie-$movieId')
          .collection('comments')
          .orderBy('create_at', descending: true)
          .limit(5)
          .get();

      final docs = response.docs;
      final List<MovieCommentEntity> comments = [];

      comments.addAll(
          docs.map((doc) => MovieCommentEntity.fromJson(doc.data())).toList());

      comments.sort((a, b) => b.createAt.compareTo(a.createAt));

      return CommentResponse.onSuccess(comments);
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      final message = 'Fail on load movie comments.\n$exceptionMessage';

      return CommentResponse.onError(null, message);
    }
  }

  Future<CommentResponse> postMovieComment(
    MovieCommentEntity comment,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(commentCollection)
          .doc('movie-${comment.movieId}')
          .collection('comments')
          .doc(comment.id)
          .set(comment.toJson());

      final commentResponse = CommentResponse.onSuccess(comment);

      return commentResponse;
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      return CommentResponse.onError(null, exceptionMessage);
    }
  }

  Future<CommentResponse> deleteMovieComment(MovieCommentEntity comment) async {
    try {
      await FirebaseFirestore.instance
          .collection(commentCollection)
          .doc('movie-${comment.movieId}')
          .collection('comments')
          .doc(comment.id)
          .delete();

      final commentResponse = CommentResponse.onSuccess(comment);

      return commentResponse;
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      return CommentResponse.onError(null, exceptionMessage);
    }
  }

  Future<CommentResponse> editComment(
    MovieCommentEntity comment,
    String newCommentText,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection(commentCollection)
          .doc('movie-${comment.movieId}')
          .collection('comments')
          .doc(comment.id)
          .update({'comment_text': newCommentText});

      return CommentResponse.onSuccess(comment);
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      return CommentResponse.onError(comment, exceptionMessage);
    }
  }
}
