import 'package:flutter/material.dart';
import 'package:movie_app/movie/data/movie_category.dart';
import 'package:movie_app/movie/repository/movie_repository.dart';
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
        //TODO: Move this to data layer
        if (!snapshot.hasError &&
            snapshot.connectionState != ConnectionState.waiting) {
          movieList.addAll(snapshot.data!);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                category.name,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              alignment: Alignment.topLeft,
              height: 250,
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                  : snapshot.hasError
                      ? Text("Error: ${snapshot.error}")
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieList.length,
                          itemBuilder: (context, index) {
                            MovieBase movie = movieList.elementAt(index);
                            return Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: MovieCard(
                                  movie: movie,
                                ));
                          },
                        ),
            )
          ],
        );
      },
      future: getMovieListFromRepository(category),
    );
  }

  Future<List<MovieBase>> getMovieListFromRepository(
      MovieCategory category) async {
    return await getMovieList(category);
  }
}
