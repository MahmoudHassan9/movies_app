import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';

import '../../result.dart';
import '../models/movie.dart';

abstract class WatchListMoviesDataSource {
  Future<Result<List<Movie>>> getWatchListMovies();

  Future<Result<bool>> addToWatchListMovies(Movie movie);
}
