import '../../data/models/movie.dart';
import '../../result.dart';

abstract class MoreLikeThisMoviesRepo {
  Future<Result<List<Movie>>> getMoreLikeThisMovies(String id);

}