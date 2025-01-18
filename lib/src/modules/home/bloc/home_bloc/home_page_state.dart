part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class LoadingMovieState extends HomePageState {}

final class FailOnLoadingMovieState extends HomePageState {
  final ExceptionModel exception;

  FailOnLoadingMovieState({required this.exception});

  @override
  List<Object> get props => [exception];
}

final class ShowMovieState extends HomePageState {
  final int timestamp;
  final MovieEntity movie;

  ShowMovieState({required this.movie, required this.timestamp});
  @override
  List<Object> get props => [timestamp];
}
