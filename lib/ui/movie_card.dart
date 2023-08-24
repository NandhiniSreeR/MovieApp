import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String movieTitle, movieImage;
  const MovieCard(
      {super.key, required this.movieTitle, required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Image.network(
            movieImage,
            width: 150,
            height: 200,
          ),
          const SizedBox(height: 4),
          Text(
            movieTitle,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
