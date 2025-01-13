import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';

abstract class CommentsServicesImpl {
  Future<Map<String, dynamic>> getMovieComments(int movidId);
  Future<Map<String, dynamic>> postComment(MovieCommentEntity comment);
}
