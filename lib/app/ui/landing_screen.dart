import 'package:flutter/material.dart';
import 'package:movie_app/movie/ui/movie_list.dart';
import 'package:movie_app/movie/data/movie_category.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),
      body: ListView(
        children: [
          MovieList(category: MovieCategory.nowPlaying),
          MovieList(category: MovieCategory.popular),
          MovieList(category: MovieCategory.topRated),
          MovieList(category: MovieCategory.upcoming)
        ],
      ),
    );
  }
}
