import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../result.dart';

abstract class WatchListMoviesRepo {
  Future<Result<List<MovieEntity>>> getWatchListMovies();

  Future<Result<bool>> addToWatchListMovies(MovieEntity movie);
}
