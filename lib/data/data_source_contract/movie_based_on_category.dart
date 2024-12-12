import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/result.dart';

abstract class MoviesBasedOnCategoryDataSource {
  Future<Result<List<Movie>>> getMoviesBasedOnCategory(String categoryId);
}