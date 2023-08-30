import 'package:flutter/material.dart';
import 'package:movie_app/movie/details/movie_details_section.dart';
import 'package:movie_app/movie/details/recommended_movies_section.dart';
import 'package:tmdb_dart/src/models/content-base.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieBase movie;
  const MovieDetailsContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDetailsSection(
          movie: movie,
        ),
        RecommendedMoviesSection(
          movie: movie,
        )
      ],
    );
  }
}
