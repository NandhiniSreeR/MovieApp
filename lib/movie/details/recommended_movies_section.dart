import 'package:flutter/material.dart';
import 'package:tmdb_dart/src/models/content-base.dart';

class RecommendedMoviesSection extends StatelessWidget {
  final MovieBase movie;
  const RecommendedMoviesSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return const Text("Recommendation section");
  }
}
