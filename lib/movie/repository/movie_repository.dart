import 'package:movie_app/movie/data/movie_category.dart';
import 'package:tmdb_dart/tmdb_dart.dart';
import 'package:movie_app/app/data/app_config.dart';

Future<List<MovieBase>> getMovieList(MovieCategory category) async {
  TmdbService service = TmdbService(AppConfig.apiKey);

  await service.initConfiguration();

  PagedResult<MovieBase> pagedResult;

  switch (category) {
    case MovieCategory.nowPlaying:
      pagedResult = await service.movie.getNowPlaying();
      break;
    case MovieCategory.popular:
      pagedResult = await service.movie.getPopular();
      break;
    case MovieCategory.topRated:
      pagedResult = await service.movie.getTopRated();
      break;
    case MovieCategory.upcoming:
      pagedResult = await service.movie.getUpComing();
      break;
  }

  return pagedResult.results;
}
