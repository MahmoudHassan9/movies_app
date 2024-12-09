import '../../data/models/movie.dart';
import '../../result.dart';

abstract class NewReleaseMovieRepo {
  Future<Result<List<Movie>>> getNewReleasesMovies();
}
