import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/movie_based_on_category.dart';
import 'package:movies_app/data/models/movie.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/moveis_based_on_category.dart';

@Injectable(as: MoviesBasedOnCategoryRepo)
class MoviesBasedOnCategoryRepoImpl extends MoviesBasedOnCategoryRepo {
  MoviesBasedOnCategoryDataSource dataSource;

  @factoryMethod
  MoviesBasedOnCategoryRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Movie>>> getMoviesBasedOnCategory(
      String categoryId) async {
    var result = await dataSource.getMoviesBasedOnCategory(categoryId);
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
