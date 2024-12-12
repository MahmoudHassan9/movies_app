import '../../data/models/movie_categories/Genres.dart';
import '../../result.dart';

abstract class CategoriesRepo {
  Future<Result<List<Category>>> getCategories();
}
