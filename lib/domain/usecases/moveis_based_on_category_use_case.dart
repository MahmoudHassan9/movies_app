import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repo_contract/moveis_based_on_category.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

@injectable
class MoviesBasedOnCategoryUseCase {
  MoviesBasedOnCategoryRepo repo;

  @factoryMethod
  MoviesBasedOnCategoryUseCase({required this.repo});

  Future<Result<List<Movie>>> execute(String categoryId) {
    return repo.getMoviesBasedOnCategory(categoryId);
  }
}
