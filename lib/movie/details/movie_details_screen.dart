import 'package:flutter/material.dart';
import 'package:movie_app/movie/details/movie_details_content.dart';
import 'package:tmdb_dart/src/models/content-base.dart'; //TODO: Replace usage with Movie

class MovieDetailsScreen extends StatelessWidget {
  final MovieBase movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Movie Details")),
        body: MovieDetailsContent(movie: movie));
  }
}
