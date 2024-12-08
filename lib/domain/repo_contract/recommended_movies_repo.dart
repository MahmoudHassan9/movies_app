import '../../data/models/recommended_movie_response/recommended_movie.dart';
import '../../result.dart';

abstract class RecommendedMoviesRepo{
  Future<Result<List<RecommendedMovie>>> getRecommendedMovies();

}