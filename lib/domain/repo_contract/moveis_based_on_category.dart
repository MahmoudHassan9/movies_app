import '../../data/models/movie.dart';
import '../../result.dart';

abstract class MoviesBasedOnCategoryRepo {
  Future<Result<List<Movie>>> getMoviesBasedOnCategory(String categoryId);
}
