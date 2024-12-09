
import '../../result.dart';
import '../models/movie.dart';

abstract class NewReleasesMoviesDataSource{
  Future<Result<List<Movie>>> getNewReleasesMovies();
}