import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/blocs/home_bloc/home_bloc.dart';
import '../../widgets/movies_slider.dart';
import '../../widgets/trending_slider.dart';

class MovieListScreen extends StatelessWidget {
  HomeState state;

  MovieListScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending Movies",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                )),
            const SizedBox(height: 12),
            if (state is HomeLoaded)
              if ((state.trendingMovies?.results?.isNotEmpty ?? false) && state.trendingMovies != null) TrendingSlider(trendingMovies: state.trendingMovies),
            const SizedBox(height: 32),
            Text("Top rated movies.",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                )),
            const SizedBox(height: 12),
            if (state is HomeLoaded)
              if ((state.topRatedMovies?.results?.isNotEmpty ?? false) && state.topRatedMovies != null) MoviesSlider(topRatedMovies: state.topRatedMovies),
            const SizedBox(height: 32),
            Text("Upcoming movies.",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold, fontSize: 16),
                )),
            const SizedBox(height: 12),
            if (state is HomeLoaded)
              if ((state.upcomingMovies?.results?.isNotEmpty ?? false) && state.upcomingMovies != null) MoviesSlider(upcomingMovies: state.upcomingMovies),

            // const MoviesSlider(),
          ],
        ),
      ),
    );
  }
}
