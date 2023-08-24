import 'package:flutter/material.dart';
import 'package:movie_app/data/movie_category.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final MovieCategory category;
  MovieList({super.key, required this.category});

  final List<MovieBase> movieList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieBase>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          movieList.addAll(snapshot.data!);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  category.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length,
                    itemBuilder: (context, index) {
                      MovieBase movie = movieList.elementAt(index);
                      return MovieCard(
                          movieTitle: movie.title,
                          movieImage: movie.posterPath!);
                    },
                  ))
            ],
          );
        }
      },
      future: getMovieListFromRepository(category),
    );
  }

  Future<List<MovieBase>> getMovieListFromRepository(
      MovieCategory category) async {
    return await getMovieDetails(category);
  }
}
