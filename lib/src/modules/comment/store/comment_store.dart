import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/models/response/comment/comment_response.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services.dart';
import 'package:mobx/mobx.dart';

part 'comment_store.g.dart';

class CommentStore = _CommentStore with _$CommentStore;

abstract class _CommentStore with Store {
  final commentsServices = CommentsServices();

  late MovieEntity movie;

  @observable
  String errorMessage = '';

  @observable
  bool isLoadingMovieComments = false;

  @observable
  ObservableList<MovieCommentEntity> comments =
      ObservableList<MovieCommentEntity>();

  @computed
  int get commentsCount => comments.length;

  @action
  loadMovieComments() async {
    isLoadingMovieComments = true;

    final response = await commentsServices.getMovieComments(movie.id!);

    if (response['success']) {
      comments.clear();
      comments.addAll(_getComments(response));
      movie.setComments(comments);
    } else {
      errorMessage = response['message'];
    }

    isLoadingMovieComments = false;
  }

  @action
  void addComment(MovieCommentEntity comment) {
    comments.add(comment);
  }

  setMovie(MovieEntity movie) {
    this.movie = movie;
  }

  List<MovieCommentEntity> _getComments(Map<String, dynamic> response) {
    final List<MovieCommentEntity> comments = [];

    List<CommentResponse> commentsResponse = response['comments_response'];

    comments.addAll(
      commentsResponse
          .map((commentResponse) =>
              MovieCommentEntity.fromCommentResponse(commentResponse))
          .toList(),
    );

    return comments;
  }
}
