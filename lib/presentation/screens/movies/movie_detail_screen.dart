import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/trending_movies.dart';

class MovieDetailsScreen extends StatefulWidget {
  Results? movieResults;

  MovieDetailsScreen({super.key, this.movieResults});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              expandedHeight: 500,
              pinned: true,
              floating: true,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                    child: Image.network("https://image.tmdb.org/t/p/w500${(widget.movieResults!.backdropPath ?? "")}", width: 200, filterQuality: FilterQuality.high, fit: BoxFit.cover)),
                title: Text(
                  widget.movieResults?.title ?? "",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                    ),
                    Text(
                      widget.movieResults?.overview ?? "",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(color: Color(0xffdedcdc), fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Text(
                                "Released On-",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 14),
                                ),
                              ),
                              Text(
                                widget.movieResults?.releaseDate ?? "",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              Text(
                                widget.movieResults?.voteAverage.toString().substring(0, 3) ?? "",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w700, fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "Language:",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.movieResults?.originalLanguage ?? "",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(color: Color(0xffdedcdc), fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
