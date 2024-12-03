part of 'home_bloc.dart';

class HomeState {
  final TrendingMovies? trendingMovies;

  HomeState({this.trendingMovies});
}

class HomeInitial extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeMoviesLoaded extends HomeState {
  final TrendingMovies? trendingMovies;

  HomeMoviesLoaded(this.trendingMovies);
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
