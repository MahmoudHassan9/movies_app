
import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../result.dart';
import '../models/movie.dart';

abstract class WatchListMoviesDataSource {
  Future<Result<List<Movie>>> getWatchListMovies();

  Future<Result<bool>> addToWatchListMovies(MovieEntity movie);
}
