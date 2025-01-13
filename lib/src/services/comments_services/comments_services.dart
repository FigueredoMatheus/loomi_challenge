import 'package:loomi_challenge/src/repositories/comments_repository/comments_repository.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services_impl.dart';

class CommentsServices implements CommentsServicesImpl {
  final _repository = CommentRepository();

  @override
  Future<Map<String, dynamic>> getMovieComments(int movieId) =>
      _repository.getMovieComments(movieId);
}
