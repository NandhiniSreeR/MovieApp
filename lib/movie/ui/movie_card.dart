import 'package:flutter/material.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

import '../details/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final MovieBase movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movie: movie)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        width: 150,
        height: 200,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: (movie.posterPath == null)
                    ? Image.asset(
                        "assets/images/default-movie-image.avif",
                        fit: BoxFit.cover,
                        width: 150,
                        height: 200,
                      )
                    : Image.network(
                        movie.posterPath!,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 200,
                      )),
            const SizedBox(height: 4),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    movie.title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
