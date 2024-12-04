import 'package:bloc/bloc.dart';
import 'package:eMeet/data/dataproviders/movie_data_provider.dart';
import 'package:eMeet/data/models/top_rated_movies.dart';
import 'package:eMeet/data/models/upcoming_movies.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trending_movies.dart';
import '../../../data/repositories/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(selectedIndex: 0));

  @override
  Stream<int> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoading) {
      onLoadTrendingMovies();
      onLoadTopMovies();
      onLoadUpComingMovies();
    }
  }

  Future onLoadTrendingMovies() async {
    emit(HomeLoading(selectedIndex: state.selectedIndex));
    MovieRepository movieRepository = MovieRepository(movieDataProvider: MovieDataProvider());
    TrendingMovies? trendingMovies = await movieRepository.fetchTrendingMovies();
    emit(HomeLoaded(selectedIndex: state.selectedIndex, upcomingMovies: state.upcomingMovies, trendingMovies: trendingMovies, topRatedMovies: state.topRatedMovies));
  }

  Future onLoadUpComingMovies() async {
    emit(HomeLoading(selectedIndex: state.selectedIndex));
    MovieRepository movieRepository = MovieRepository(movieDataProvider: MovieDataProvider());
    UpcomingMovies? upcomingMovies = await movieRepository.fetchUpcomingMovies();
    emit(HomeLoaded(selectedIndex: state.selectedIndex, upcomingMovies: upcomingMovies, trendingMovies: state.trendingMovies, topRatedMovies: state.topRatedMovies));
  }

  Future onLoadTopMovies() async {
    emit(HomeLoading(selectedIndex: state.selectedIndex));
    MovieRepository movieRepository = MovieRepository(movieDataProvider: MovieDataProvider());
    TopRatedMovies? topRatedMovies = await movieRepository.fetchTopMovies();
    emit(HomeLoaded(selectedIndex: state.selectedIndex, upcomingMovies: state.upcomingMovies, trendingMovies: state.trendingMovies, topRatedMovies: topRatedMovies));
  }

  void onButtonSelected(int value) {
    state.selectedIndex = value;
    emit(HomeLoaded(selectedIndex: state.selectedIndex, upcomingMovies: state.upcomingMovies, trendingMovies: state.trendingMovies, topRatedMovies: state.topRatedMovies));
  }
}
