part of 'home_bloc.dart';

class HomeState {
  final TrendingMovies? trendingMovies;
  final TopRatedMovies? topRatedMovies;
  final UpcomingMovies? upcomingMovies;
  int selectedIndex;

  HomeState({this.trendingMovies, this.topRatedMovies, this.upcomingMovies, required this.selectedIndex});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.selectedIndex});
}

class HomeLoading extends HomeState {
  HomeLoading({required super.selectedIndex});
}

class HomeLoaded extends HomeState {
  final TrendingMovies? trendingMovies;
  final TopRatedMovies? topRatedMovies;
  final UpcomingMovies? upcomingMovies;

  HomeLoaded({this.trendingMovies, this.topRatedMovies, this.upcomingMovies, required super.selectedIndex});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message, required super.selectedIndex});

  @override
  List<Object> get props => [message];
}
