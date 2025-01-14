import 'package:get/get.dart';
import 'package:loomi_challenge/src/common/utils/dialogs/confirmation_dialog.dart';
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

  late MovieCommentEntity commentToBeEdited;

  @observable
  bool editCommentMode = false;

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

  onSubmitCommentText(String commentText, UserEntity user) {
    if (editCommentMode) {
      editMovieComment(commentText);
    } else {
      addComment(commentText, user);
    }
  }

  @action
  editMovieComment(String commentText) {
    cancelEditMode();

    commentsServices
        .editComment(commentToBeEdited, commentText)
        .then((response) {
      if (!response.success) {
        updateCommentText(
          commentId: response.data.id!,
          text: response.data.commentText,
        );

        MyAppSnackBar(
          message: response.message,
          snackBarType: SnackBarType.fail,
        ).show();
      }
    });

    updateCommentText(commentId: commentToBeEdited.id!, text: commentText);
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
      status: CommentStatus.Sending,
    );

    insertComment(comment);

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
  onEditComment(MovieCommentEntity comment) {
    Get.back();
    commentToBeEdited = comment;
    editCommentMode = true;
  }

  @action
  onDeleteComment(MovieCommentEntity comment) async {
    final confirmationResult = await confirmationAlertDialog(
        title: 'Do you want to delete this comment?');

    if (confirmationResult == null || confirmationResult == 0) return;

    Get.back();

    commentsServices.deleteComment(comment).then((response) {
      if (!response.success) {
        insertComment(comment);

        MyAppSnackBar(
          message: response.message,
          snackBarType: SnackBarType.fail,
        ).show();
      }
    });

    removeComment(comment.id!);
  }

  @action
  onReportComment(MovieCommentEntity comment) {
    Get.back();
    MyAppSnackBar(
      message: 'Comment has been reported successfully.',
      snackBarType: SnackBarType.success,
    ).show();
  }

  @action
  updateCommentText({required String commentId, required String text}) {
    comments
        .firstWhere((element) => element.id == commentId)
        .setCommentText(text);
  }

  @action
  updateCommentStatus({
    required MovieCommentEntity comment,
    required CommentStatus status,
  }) {
    comments
        .firstWhere((element) => element.id == comment.id)
        .setCommentStatus(status);
  }

  @action
  insertComment(MovieCommentEntity comment) {
    comments.add(comment);
    comments.sort((a, b) => b.createAt.compareTo(a.createAt));
  }

  @action
  removeComment(String commentId) {
    comments.removeWhere((element) => element.id! == commentId);
  }

  @action
  cancelEditMode() {
    editCommentMode = false;
  }

  @action
  onDispose() {
    cancelEditMode();
  }
}
