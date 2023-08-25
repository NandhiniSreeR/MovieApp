import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String movieTitle, movieImage;
  const MovieCard(
      {super.key, required this.movieTitle, required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,),
      width: 150,
      height: 200,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                fit: BoxFit.cover,
                movieImage,
                width: 150,
                height: 200,
              )),
          const SizedBox(height: 4),
          Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    movieTitle,
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
