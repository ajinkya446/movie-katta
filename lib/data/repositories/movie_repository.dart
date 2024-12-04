import 'package:eMeet/data/models/trending_movies.dart';
import 'package:eMeet/data/models/upcoming_movies.dart';

import '../dataproviders/movie_data_provider.dart';
import '../models/top_rated_movies.dart';

class MovieRepository {
  late MovieDataProvider movieDataProvider;

  MovieRepository({required this.movieDataProvider});

  Future<TrendingMovies?> fetchTrendingMovies() async {
    return await movieDataProvider.getTrendingMovies();
  }

  Future<TopRatedMovies?> fetchTopMovies() async {
    return await movieDataProvider.getTopMovie();
  }

  Future<UpcomingMovies?> fetchUpcomingMovies() async {
    return await movieDataProvider.getUpcomingMovie();
  }
}
