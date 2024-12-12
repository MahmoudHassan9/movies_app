import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/categories_movies_repo.dart';
import '../data_source_contract/categories_data_source_contract.dart';

@Injectable(as: CategoriesRepo)
class CategoriesMoviesRepoImpl extends CategoriesRepo {
  CategoriesDataSource dataSource;

  @factoryMethod
  CategoriesMoviesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Category>>> getCategories() async {
    var result = await dataSource.getCategories();

    switch (result) {
      case Success<List<Category>>():
        return Success(data: result.data);
      case Error<List<Category>>():
        return Error(exception: result.exception);
    }
  }
}
