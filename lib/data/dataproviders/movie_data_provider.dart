import 'package:eMeet/data/models/genre_list.dart';
import 'package:eMeet/data/models/trending_movies.dart';

import '../../config/constants.dart';
import '../../services/api_service.dart';
import '../models/top_rated_movies.dart';
import '../models/upcoming_movies.dart';

class MovieDataProvider {
  Future<TrendingMovies?> getTrendingMovies() async {
    final result = await APIService().getMethod(Constants.trendingMovies);
    TrendingMovies trendingMovies = TrendingMovies.fromJson(result ?? "");
    return trendingMovies;
  }

  Future<TrendingMovies?> filterMoviesByGenre(String genreId) async {
    final result = await APIService().getMethod("${Constants.filterMovies}$genreId");
    TrendingMovies trendingMovies = TrendingMovies.fromJson(result ?? "");
    return trendingMovies;
  }

  Future<TopRatedMovies> getTopMovie() async {
    final result = await APIService().getMethod(Constants.topRatedMovies);
    TopRatedMovies topRatedMovies = TopRatedMovies.fromJson(result ?? "");
    return topRatedMovies;
  }

  Future<UpcomingMovies> getUpcomingMovie() async {
    final result = await APIService().getMethod(Constants.trendingMovies);
    UpcomingMovies upcomingMovies = UpcomingMovies.fromJson(result ?? "");
    return upcomingMovies;
  }

  Future<GenreList> fetchMovieGenre() async {
    final result = await APIService().getMethod(Constants.moviesGenre);
    GenreList genreList = GenreList.fromJson(result ?? "");
    return genreList;
  }
}
