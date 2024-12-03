import 'package:bloc/bloc.dart';
import 'package:eMeet/data/dataproviders/movie_data_provider.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trending_movies.dart';
import '../../../data/repositories/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<int> mapEventToState(HomeEvent event) async* {
    if (event is HomeInProgress) {
      onLoadTrendingMovies();
    }
  }

  Future<TrendingMovies?> onLoadTrendingMovies() async {
    emit(HomeInProgress());
    MovieRepository movieRepository = MovieRepository(movieDataProvider: MovieDataProvider());
    TrendingMovies? trendingMovies = await movieRepository.fetchTrendingMovies();
    emit(HomeMoviesLoaded(trendingMovies));
  }
}
