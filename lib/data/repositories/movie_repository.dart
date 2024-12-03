import 'package:eMeet/data/models/trending_movies.dart';

import '../dataproviders/movie_data_provider.dart';

class MovieRepository {
  late MovieDataProvider movieDataProvider;

  MovieRepository({required this.movieDataProvider});

  Future<TrendingMovies?> fetchTrendingMovies() async {
    return await movieDataProvider.getTrendingMovies();
  }
}
