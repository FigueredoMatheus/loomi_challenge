// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviePlayerController on _MoviePlayerController, Store {
  late final _$isCommetsDisplayedAtom =
      Atom(name: '_MoviePlayerController.isCommetsDisplayed', context: context);

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
      Atom(name: '_MoviePlayerController.hideOverlays', context: context);

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

  late final _$_MoviePlayerControllerActionController =
      ActionController(name: '_MoviePlayerController', context: context);

  @override
  dynamic toggleOverlaysView() {
    final _$actionInfo = _$_MoviePlayerControllerActionController.startAction(
        name: '_MoviePlayerController.toggleOverlaysView');
    try {
      return super.toggleOverlaysView();
    } finally {
      _$_MoviePlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleMovieCommentsVisibility() {
    final _$actionInfo = _$_MoviePlayerControllerActionController.startAction(
        name: '_MoviePlayerController.toggleMovieCommentsVisibility');
    try {
      return super.toggleMovieCommentsVisibility();
    } finally {
      _$_MoviePlayerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCommetsDisplayed: ${isCommetsDisplayed},
hideOverlays: ${hideOverlays}
    ''';
  }
}
