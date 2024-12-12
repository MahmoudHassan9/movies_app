import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repo_contract/categories_movies_repo.dart';

import '../../data/models/movie_categories/Genres.dart';
import '../../result.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepo repo;

  @factoryMethod
  CategoriesUseCase({required this.repo});

  Future<Result<List<Category>>> execute() {
    return repo.getCategories();
  }
}
