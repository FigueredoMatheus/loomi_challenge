import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/core/data/constants.dart';
import 'package:loomi_challenge/src/core/helpers/handle_firebase_exceptions_helper.dart';
import 'package:loomi_challenge/src/core/services/firebase/firebase_instances.dart';
import 'package:loomi_challenge/src/core/services/get_it.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';
import 'package:loomi_challenge/src/models/response/comment/comments_pagination_response.dart';

class CommentRepository {
  final commentCollection = 'movie-comments';

  final firestoreInstance = getIt<FirebaseManager>().firestoreInstance;

  Future<CommentsPaginationResponse> getMovieComments(
    int movieId,
    DocumentSnapshot? lastDocument,
  ) async {
    try {
      Query query = firestoreInstance
          .collection(commentCollection)
          .doc('movie-$movieId')
          .collection('comments')
          .orderBy('create_at', descending: true)
          .limit(ApplicationConstants.QUERY_COMMENTS_LIMIT);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final response = await query.get();

      final docs = response.docs;

      final List<MovieCommentEntity> comments = docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        return MovieCommentEntity.fromJson(data);
      }).toList();

      return CommentsPaginationResponse.onSuccess(
        comments,
        docs.isNotEmpty ? docs.last : null,
      );
    } on FirebaseException catch (e) {
      final exceptionMessage =
          HandleFirebaseExceptionsHelper.getFirebaseException(e);

      final message = 'Fail on load movie comments.\n$exceptionMessage';

      return CommentsPaginationResponse.onError(message);
    }
  }

  Future<CommentResponse> postMovieComment(
    MovieCommentEntity comment,
  ) async {
    try {
      await firestoreInstance
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
      await firestoreInstance
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
      await firestoreInstance
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
