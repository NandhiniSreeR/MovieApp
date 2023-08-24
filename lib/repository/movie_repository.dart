import 'package:movie_app/data/movie_category.dart';
import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:movie_app/data/app_config.dart';

Future<List<MovieBase>> getMovieDetails(MovieCategory category) async {
  TmdbService service = TmdbService(AppConfig.apiKey);

  await service.initConfiguration();

  var pagedResult = await service.movie.getNowPlaying();

  return pagedResult.results;
}
