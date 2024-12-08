import '../../data/models/movie.dart';
import '../../result.dart';

abstract class PopularMoviesRepo{
  Future<Result<List<Movie>>> getPopularMovies();

}