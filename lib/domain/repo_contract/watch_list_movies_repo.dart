import '../../data/models/movie.dart';
import '../../data/models/movie_watch_list_response/movie_wacth_list.dart';
import '../../result.dart';

abstract class WatchListMoviesRepo {
  Future<Result<List<Movie>>> getWatchListMovies();

  Future<Result<bool>> addToWatchListMovies(Movie movie);
}
