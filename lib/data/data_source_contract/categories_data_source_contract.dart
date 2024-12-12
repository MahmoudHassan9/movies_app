import 'package:movies_app/data/models/movie_categories/Genres.dart';
import 'package:movies_app/result.dart';

abstract class CategoriesDataSource {
  Future<Result<List<Category>>> getCategories();
}
