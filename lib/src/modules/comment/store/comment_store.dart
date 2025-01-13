import 'package:loomi_challenge/src/common/utils/random_string_generator.dart';
import 'package:loomi_challenge/src/common/utils/snack_bar.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';
import 'package:loomi_challenge/src/models/entity/movie_comment_entity/movie_comment_entity.dart';
import 'package:loomi_challenge/src/models/entity/movie_entity/movie_entity.dart';
import 'package:loomi_challenge/src/models/entity/user_entity/user_entity.dart';
import 'package:loomi_challenge/src/services/comments_services/comments_services.dart';
import 'package:mobx/mobx.dart';

part 'comment_store.g.dart';

class CommentStore = _CommentStore with _$CommentStore;

abstract class _CommentStore with Store {
  final commentsServices = CommentsServices();

  late MovieEntity movie;

  @observable
  String? errorMessage;

  @observable
  bool isLoadingMovieComments = false;

  @observable
  bool isSendingComment = false;

  @observable
  ObservableList<MovieCommentEntity> comments =
      ObservableList<MovieCommentEntity>();

  @computed
  int get commentsCount => comments.length;

  @computed
  bool get hasError => errorMessage != null;

  init(MovieEntity movie) {
    this.movie = movie;
  }

  @action
  loadMovieComments() async {
    isLoadingMovieComments = true;

    final response = await commentsServices.getMovieComments(movie.id!);

    if (response.success) {
      comments.clear();
      comments.addAll(response.data);
      movie.setComments(comments);
    } else {
      errorMessage = response.message;
    }

    isLoadingMovieComments = false;
  }

  @action
  Future addComment(String commentText, UserEntity user) async {
    isSendingComment = true;

    final comment = MovieCommentEntity(
      id: generateRandomStringBasedOnDateTime(),
      commentText: commentText,
      user: user,
      createAt: DateTime.now(),
      replies: 0,
      movieId: this.movie.id!,
    );

    comments.insert(0, comment);

    commentsServices.postComment(comment).then((response) {
      if (!response.success) {
        MyAppSnackBar(
                message: response.message, snackBarType: SnackBarType.fail)
            .show();
        removeComment(response.data.id);
      }
    });

    isSendingComment = false;
  }

  @action
  removeComment(int commentId) {
    comments.removeWhere((element) => element.id! == commentId);
  }
}
