import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';
import 'package:loomi_challenge/src/models/response/comment/comments_pagination_response.dart';

abstract class CommentsServicesImpl {
  Future<CommentsPaginationResponse> getMovieComments(
    int movieId,
    DocumentSnapshot? lastDocument,
  );
  Future<CommentResponse> postComment(MovieCommentEntity comment);
  Future<CommentResponse> deleteComment(MovieCommentEntity comment);
  Future<CommentResponse> editComment(
    MovieCommentEntity comment,
    String newCommentText,
  );
}
