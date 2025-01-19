// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviePlayerStore on _MoviePlayerStore, Store {
  late final _$currentSubtitleIndexAtom =
      Atom(name: '_MoviePlayerStore.currentSubtitleIndex', context: context);

  @override
  int get currentSubtitleIndex {
    _$currentSubtitleIndexAtom.reportRead();
    return super.currentSubtitleIndex;
  }

  @override
  set currentSubtitleIndex(int value) {
    _$currentSubtitleIndexAtom.reportWrite(value, super.currentSubtitleIndex,
        () {
      super.currentSubtitleIndex = value;
    });
  }

  late final _$currentAudioIndexAtom =
      Atom(name: '_MoviePlayerStore.currentAudioIndex', context: context);

  @override
  int get currentAudioIndex {
    _$currentAudioIndexAtom.reportRead();
    return super.currentAudioIndex;
  }

  @override
  set currentAudioIndex(int value) {
    _$currentAudioIndexAtom.reportWrite(value, super.currentAudioIndex, () {
      super.currentAudioIndex = value;
    });
  }

  late final _$currentProgressAtom =
      Atom(name: '_MoviePlayerStore.currentProgress', context: context);

  @override
  Duration get currentProgress {
    _$currentProgressAtom.reportRead();
    return super.currentProgress;
  }

  @override
  set currentProgress(Duration value) {
    _$currentProgressAtom.reportWrite(value, super.currentProgress, () {
      super.currentProgress = value;
    });
  }

  late final _$isMoviePlayingAtom =
      Atom(name: '_MoviePlayerStore.isMoviePlaying', context: context);

  @override
  bool get isMoviePlaying {
    _$isMoviePlayingAtom.reportRead();
    return super.isMoviePlaying;
  }

  @override
  set isMoviePlaying(bool value) {
    _$isMoviePlayingAtom.reportWrite(value, super.isMoviePlaying, () {
      super.isMoviePlaying = value;
    });
  }

  late final _$isLoadingMovieSubtitlesAtom =
      Atom(name: '_MoviePlayerStore.isLoadingMovieSubtitles', context: context);

  @override
  bool get isLoadingMovieSubtitles {
    _$isLoadingMovieSubtitlesAtom.reportRead();
    return super.isLoadingMovieSubtitles;
  }

  @override
  set isLoadingMovieSubtitles(bool value) {
    _$isLoadingMovieSubtitlesAtom
        .reportWrite(value, super.isLoadingMovieSubtitles, () {
      super.isLoadingMovieSubtitles = value;
    });
  }

  late final _$isCommetsDisplayedAtom =
      Atom(name: '_MoviePlayerStore.isCommetsDisplayed', context: context);

  @override
  bool get isCommetsDisplayed {
    _$isCommetsDisplayedAtom.reportRead();
    return super.isCommetsDisplayed;
  }

  @override
  set isCommetsDisplayed(bool value) {
    _$isCommetsDisplayedAtom.reportWrite(value, super.isCommetsDisplayed, () {
      super.isCommetsDisplayed = value;
    });
  }

  late final _$hideOverlaysAtom =
      Atom(name: '_MoviePlayerStore.hideOverlays', context: context);

  @override
  bool get hideOverlays {
    _$hideOverlaysAtom.reportRead();
    return super.hideOverlays;
  }

  @override
  set hideOverlays(bool value) {
    _$hideOverlaysAtom.reportWrite(value, super.hideOverlays, () {
      super.hideOverlays = value;
    });
  }

  late final _$_MoviePlayerStoreActionController =
      ActionController(name: '_MoviePlayerStore', context: context);

  @override
  dynamic setCurrentSubtitleIndex(int index) {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.setCurrentSubtitleIndex');
    try {
      return super.setCurrentSubtitleIndex(index);
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentAudioIndex(int index) {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.setCurrentAudioIndex');
    try {
      return super.setCurrentAudioIndex(index);
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProgress() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.updateProgress');
    try {
      return super.updateProgress();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleOverlaysView() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.toggleOverlaysView');
    try {
      return super.toggleOverlaysView();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openCommentsSection() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.openCommentsSection');
    try {
      return super.openCommentsSection();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeCommentsSection() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.closeCommentsSection');
    try {
      return super.closeCommentsSection();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backward() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.backward');
    try {
      return super.backward();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic forward() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.forward');
    try {
      return super.forward();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playPauseButton() {
    final _$actionInfo = _$_MoviePlayerStoreActionController.startAction(
        name: '_MoviePlayerStore.playPauseButton');
    try {
      return super.playPauseButton();
    } finally {
      _$_MoviePlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSubtitleIndex: ${currentSubtitleIndex},
currentAudioIndex: ${currentAudioIndex},
currentProgress: ${currentProgress},
isMoviePlaying: ${isMoviePlaying},
isLoadingMovieSubtitles: ${isLoadingMovieSubtitles},
isCommetsDisplayed: ${isCommetsDisplayed},
hideOverlays: ${hideOverlays}
    ''';
  }
}
