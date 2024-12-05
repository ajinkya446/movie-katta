part of 'home_bloc.dart';

class HomeState {
  TrendingMovies? trendingMovies;
  TrendingMovies? discoverMovies;
  TopRatedMovies? topRatedMovies;
  UpcomingMovies? upcomingMovies;
  GenreList? genreList;
  int selectedIndex;

  HomeState({this.trendingMovies, this.discoverMovies, this.topRatedMovies, this.upcomingMovies, this.genreList, required this.selectedIndex});
}

class HomeInitial extends HomeState {
  HomeInitial({required super.selectedIndex});
}

class HomeLoading extends HomeState {
  HomeLoading({required super.selectedIndex});
}

class HomeLoaded extends HomeState {
  @override
  TrendingMovies? trendingMovies;
  @override
  TrendingMovies? discoverMovies;
  @override
  TopRatedMovies? topRatedMovies;
  @override
  UpcomingMovies? upcomingMovies;
  @override
  GenreList? genreList;

  HomeLoaded({this.trendingMovies, this.discoverMovies, this.topRatedMovies, this.upcomingMovies, this.genreList, required super.selectedIndex});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message, required super.selectedIndex});

  @override
  List<Object> get props => [message];
}
