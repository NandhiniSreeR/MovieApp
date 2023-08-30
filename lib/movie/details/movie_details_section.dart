import 'package:flutter/material.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

class MovieDetailsSection extends StatelessWidget {
  final MovieBase movie;
  const MovieDetailsSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        (movie.posterPath == null)
            ? Image.asset(
                "assets/images/default-movie-image.avif",
                fit: BoxFit.cover,
                width: 175,
                height: 300,
              )
            : Image.network(
                movie.backdropPath!,
                fit: BoxFit.contain,
                width: 390,
                height: 600,
              ),
        Column(
          children: [
            Text(movie.title),
            Text("${movie.originalLanguage} . ${movie.releaseDate}"),
            if (movie.overview == null)
              const Text("")
            else
              Column(
                children: [
                  const Text("Overview"),
                  Text(
                    movie.overview!,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
          ],
        ),
      ],
    );
  }
}
