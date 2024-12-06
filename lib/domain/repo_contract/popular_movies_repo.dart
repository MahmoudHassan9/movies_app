import '../../data/models/popular_movie_response/popular_movie.dart';
import '../../result.dart';

abstract class PopularMoviesRepo{
  Future<Result<List<PopularMovie>>> getPopularMovies();

}