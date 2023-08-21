import 'package:movie_app/data/movie_category.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

Future<List<MovieBase>> getMovieDetails(MovieCategory category) async {
  TmdbService service = TmdbService("df1b88aeb63dda23a26039149f8e1d0e");

  await service.initConfiguration();

  var pagedResult = await service.movie.getNowPlaying();

  return pagedResult.results;
}
