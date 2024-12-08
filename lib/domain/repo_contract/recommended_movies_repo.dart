import '../../data/models/movie.dart';
import '../../result.dart';

abstract class RecommendedMoviesRepo{
  Future<Result<List<Movie>>> getRecommendedMovies();

}