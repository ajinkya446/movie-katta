part of 'home_bloc.dart';

class HomeState {
  final TrendingMovies? trendingMovies;
  final TopRatedMovies? topRatedMovies;
  final UpcomingMovies? upcomingMovies;

  HomeState({this.trendingMovies, this.topRatedMovies, this.upcomingMovies});
}

class HomeInitial extends HomeState {}

class TrendingLoading extends HomeState {}

class TopRateLoading extends HomeState {}

class HomeLoading extends HomeState {}

class UpcomingLoading extends HomeState {}

class TrendingMoviesLoaded extends HomeState {
  final TrendingMovies? trendingMovies;

  TrendingMoviesLoaded({this.trendingMovies});
}

class TopMoviesLoaded extends HomeState {
  final TopRatedMovies? topRatedMovies;

  TopMoviesLoaded({this.topRatedMovies});
}

class UpcomingMoviesLoaded extends HomeState {
  final UpcomingMovies? upcomingMovies;

  UpcomingMoviesLoaded({this.upcomingMovies});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
