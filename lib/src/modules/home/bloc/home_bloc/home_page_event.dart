part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class LoadMovieEvent extends HomePageEvent {
  final int movieId;

  LoadMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

final class ShowMovieEvent extends HomePageEvent {}

final class UpdateMovieCommentsEvent extends HomePageEvent {
  final List<MovieCommentEntity> comments;

  UpdateMovieCommentsEvent({required this.comments});

  @override
  List<Object> get props => [comments];
}
