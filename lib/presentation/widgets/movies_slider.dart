import 'package:eMeet/presentation/screens/movies/movie_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../data/models/top_rated_movies.dart';
import '../../data/models/trending_movies.dart';
import '../../data/models/upcoming_movies.dart';

class MoviesSlider extends StatefulWidget {
  TopRatedMovies? topRatedMovies;
  UpcomingMovies? upcomingMovies;

  MoviesSlider({super.key, this.topRatedMovies, this.upcomingMovies});

  @override
  State<MoviesSlider> createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          itemCount: widget.upcomingMovies != null ? widget.upcomingMovies!.results!.length : widget.topRatedMovies!.results!.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Results? moviesResult = widget.upcomingMovies == null ? widget.topRatedMovies!.results![index] : widget.upcomingMovies?.results![index];
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => MovieDetailsScreen(movieResults: moviesResult)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                      color: Colors.yellow,
                      width: MediaQuery.of(context).size.width * 0.450,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w500${widget.upcomingMovies != null ? (widget.upcomingMovies!.results![index].posterPath ?? "") : (widget.topRatedMovies!.results![index].posterPath ?? "")}",
                          width: 200,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.cover)),
                ),
              ),
            );
          }),
    );
  }
}
