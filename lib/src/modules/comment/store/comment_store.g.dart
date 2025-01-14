// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentStore on _CommentStore, Store {
  Computed<int>? _$commentsCountComputed;

  @override
  int get commentsCount =>
      (_$commentsCountComputed ??= Computed<int>(() => super.commentsCount,
              name: '_CommentStore.commentsCount'))
          .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_CommentStore.hasError'))
      .value;

  late final _$isFetchingNextCommentsPageAtom =
      Atom(name: '_CommentStore.isFetchingNextCommentsPage', context: context);

  @override
  bool get isFetchingNextCommentsPage {
    _$isFetchingNextCommentsPageAtom.reportRead();
    return super.isFetchingNextCommentsPage;
  }

  @override
  set isFetchingNextCommentsPage(bool value) {
    _$isFetchingNextCommentsPageAtom
        .reportWrite(value, super.isFetchingNextCommentsPage, () {
      super.isFetchingNextCommentsPage = value;
    });
  }

  late final _$hasMoreUnloadedCommentsAtom =
      Atom(name: '_CommentStore.hasMoreUnloadedComments', context: context);

  @override
  bool get hasMoreUnloadedComments {
    _$hasMoreUnloadedCommentsAtom.reportRead();
    return super.hasMoreUnloadedComments;
  }

  @override
  set hasMoreUnloadedComments(bool value) {
    _$hasMoreUnloadedCommentsAtom
        .reportWrite(value, super.hasMoreUnloadedComments, () {
      super.hasMoreUnloadedComments = value;
    });
  }

  late final _$editCommentModeAtom =
      Atom(name: '_CommentStore.editCommentMode', context: context);

  @override
  bool get editCommentMode {
    _$editCommentModeAtom.reportRead();
    return super.editCommentMode;
  }

  @override
  set editCommentMode(bool value) {
    _$editCommentModeAtom.reportWrite(value, super.editCommentMode, () {
      super.editCommentMode = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CommentStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isLoadingMovieCommentsAtom =
      Atom(name: '_CommentStore.isLoadingMovieComments', context: context);

  @override
  bool get isLoadingMovieComments {
    _$isLoadingMovieCommentsAtom.reportRead();
    return super.isLoadingMovieComments;
  }

  @override
  set isLoadingMovieComments(bool value) {
    _$isLoadingMovieCommentsAtom
        .reportWrite(value, super.isLoadingMovieComments, () {
      super.isLoadingMovieComments = value;
    });
  }

  late final _$isSendingCommentAtom =
      Atom(name: '_CommentStore.isSendingComment', context: context);

  @override
  bool get isSendingComment {
    _$isSendingCommentAtom.reportRead();
    return super.isSendingComment;
  }

  @override
  set isSendingComment(bool value) {
    _$isSendingCommentAtom.reportWrite(value, super.isSendingComment, () {
      super.isSendingComment = value;
    });
  }

  late final _$commentsAtom =
      Atom(name: '_CommentStore.comments', context: context);

  @override
  ObservableList<MovieCommentEntity> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<MovieCommentEntity> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$getMovieCommentsAsyncAction =
      AsyncAction('_CommentStore.getMovieComments', context: context);

  @override
  Future getMovieComments() {
    return _$getMovieCommentsAsyncAction.run(() => super.getMovieComments());
  }

  late final _$fetchNextCommentsPageAsyncAction =
      AsyncAction('_CommentStore.fetchNextCommentsPage', context: context);

  @override
  Future fetchNextCommentsPage() {
    return _$fetchNextCommentsPageAsyncAction
        .run(() => super.fetchNextCommentsPage());
  }

  late final _$addCommentAsyncAction =
      AsyncAction('_CommentStore.addComment', context: context);

  @override
  Future<dynamic> addComment(String commentText, UserEntity user) {
    return _$addCommentAsyncAction
        .run(() => super.addComment(commentText, user));
  }

  late final _$onDeleteCommentAsyncAction =
      AsyncAction('_CommentStore.onDeleteComment', context: context);

  @override
  Future onDeleteComment(MovieCommentEntity comment) {
    return _$onDeleteCommentAsyncAction
        .run(() => super.onDeleteComment(comment));
  }

  late final _$_CommentStoreActionController =
      ActionController(name: '_CommentStore', context: context);

  @override
  dynamic editMovieComment(String commentText) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.editMovieComment');
    try {
      return super.editMovieComment(commentText);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEditComment(MovieCommentEntity comment) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.onEditComment');
    try {
      return super.onEditComment(comment);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onReportComment(MovieCommentEntity comment) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.onReportComment');
    try {
      return super.onReportComment(comment);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCommentText({required String commentId, required String text}) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.updateCommentText');
    try {
      return super.updateCommentText(commentId: commentId, text: text);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCommentStatus(
      {required MovieCommentEntity comment, required CommentStatus status}) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.updateCommentStatus');
    try {
      return super.updateCommentStatus(comment: comment, status: status);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic insertComment(MovieCommentEntity comment) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.insertComment');
    try {
      return super.insertComment(comment);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeComment(String commentId) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.removeComment');
    try {
      return super.removeComment(commentId);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancelEditMode() {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.cancelEditMode');
    try {
      return super.cancelEditMode();
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDispose() {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.onDispose');
    try {
      return super.onDispose();
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFetchingNextCommentsPage: ${isFetchingNextCommentsPage},
hasMoreUnloadedComments: ${hasMoreUnloadedComments},
editCommentMode: ${editCommentMode},
errorMessage: ${errorMessage},
isLoadingMovieComments: ${isLoadingMovieComments},
isSendingComment: ${isSendingComment},
comments: ${comments},
commentsCount: ${commentsCount},
hasError: ${hasError}
    ''';
  }
}
