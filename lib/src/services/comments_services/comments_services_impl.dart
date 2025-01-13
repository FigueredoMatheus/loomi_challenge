import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';

abstract class CommentsServicesImpl {
  Future<CommentResponse> getMovieComments(int movidId);
  Future<CommentResponse> postComment(MovieCommentEntity comment);
  Future<CommentResponse> deleteComment(MovieCommentEntity comment);
}
