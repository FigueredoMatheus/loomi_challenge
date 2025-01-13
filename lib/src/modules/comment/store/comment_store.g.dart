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

  late final _$errorMessageAtom =
      Atom(name: '_CommentStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
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

  late final _$loadMovieCommentsAsyncAction =
      AsyncAction('_CommentStore.loadMovieComments', context: context);

  @override
  Future loadMovieComments() {
    return _$loadMovieCommentsAsyncAction.run(() => super.loadMovieComments());
  }

  late final _$_CommentStoreActionController =
      ActionController(name: '_CommentStore', context: context);

  @override
  void addComment(MovieCommentEntity comment) {
    final _$actionInfo = _$_CommentStoreActionController.startAction(
        name: '_CommentStore.addComment');
    try {
      return super.addComment(comment);
    } finally {
      _$_CommentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoadingMovieComments: ${isLoadingMovieComments},
comments: ${comments},
commentsCount: ${commentsCount}
    ''';
  }
}