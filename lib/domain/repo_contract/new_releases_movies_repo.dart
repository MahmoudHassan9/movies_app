import '../../data/models/new_release_movie_response/new_releases_movie.dart';
import '../../result.dart';

abstract class NewReleaseMovieRepo {
  Future<Result<List<NewReleaseMovie>>> getNewReleasesMovies();
}
