import 'package:eMeet/data/models/trending_movies.dart';

import '../../config/constants.dart';
import '../../services/api_service.dart';

class MovieDataProvider {
  Future<TrendingMovies?> getTrendingMovies() async {
    final result = await APIService().getMethod(Constants.trendingMovies);
    TrendingMovies trendingMovies = TrendingMovies.fromJson(result ?? "");
    return trendingMovies;
  }
}
