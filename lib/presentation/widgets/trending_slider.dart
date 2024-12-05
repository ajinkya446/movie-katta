import 'package:carousel_slider/carousel_slider.dart';
import 'package:eMeet/data/models/trending_movies.dart';
import 'package:flutter/material.dart';

import '../screens/movies/movie_detail_screen.dart';

class TrendingSlider extends StatefulWidget {
  TrendingMovies? trendingMovies;

  TrendingSlider({super.key, this.trendingMovies});

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CarouselSlider.builder(
          itemCount: widget.trendingMovies!.results!.length,
          itemBuilder: (ctx, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Results? moviesResult = widget.trendingMovies?.results![itemIndex];
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => MovieDetailsScreen(movieResults: moviesResult)));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 200,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Colors.yellow,
                    child: Image.network("https://image.tmdb.org/t/p/w500${widget.trendingMovies!.results![itemIndex].posterPath ?? ""}",
                        width: 200, height: MediaQuery.of(context).size.height * 0.4, fit: BoxFit.cover),
                  )),
            );
          },
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlay: true,
              viewportFraction: 0.55,
              autoPlayAnimationDuration: const Duration(seconds: 1))),
    );
  }
}
