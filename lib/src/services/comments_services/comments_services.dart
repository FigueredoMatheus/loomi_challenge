import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';
import 'package:loomi_challenge/src/models/response/comment/comments_pagination_response.dart';
import 'package:loomi_challenge/src/repositories/comments_repository/comments_repository.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services_impl.dart';

class CommentsServices implements CommentsServicesImpl {
  final _repository = CommentRepository();

  @override
  Future<CommentsPaginationResponse> getMovieComments(
    int movieId,
    DocumentSnapshot? lastDocument,
  ) =>
      _repository.getMovieComments(movieId, lastDocument);

  @override
  Future<CommentResponse> postComment(MovieCommentEntity comment) =>
      _repository.postMovieComment(comment);

  @override
  Future<CommentResponse> deleteComment(MovieCommentEntity comment) =>
      _repository.deleteMovieComment(comment);

  @override
  Future<CommentResponse> editComment(
    MovieCommentEntity comment,
    String newCommentText,
  ) =>
      _repository.editComment(comment, newCommentText);
}
