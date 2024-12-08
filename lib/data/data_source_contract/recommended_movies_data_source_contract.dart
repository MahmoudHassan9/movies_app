
import '../../result.dart';
import '../models/movie.dart';

abstract class RecommendedMoviesDataSource{
  Future<Result<List<Movie>>> getRecommendedMovies();

}