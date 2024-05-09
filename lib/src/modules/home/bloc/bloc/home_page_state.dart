part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class LoadingMovieState extends HomePageState {}

final class FailOnLoadingMovieState extends HomePageState {
  final DioExceptionModel exception;

  FailOnLoadingMovieState({required this.exception});

  @override
  List<Object> get props => [exception];
}

final class SuccessOnLoadingMovieState extends HomePageState {
  final MovieEntity movie;

  SuccessOnLoadingMovieState({required this.movie});
  @override
  List<Object> get props => [movie];
}
