import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/models/movie.dart';

import 'package:movies_app/result.dart';

import '../data_source_contract/movie_based_on_category.dart';

@Injectable(as: MoviesBasedOnCategoryDataSource)
class MoviesBasedOnCategoryDataSourceImpl
    extends MoviesBasedOnCategoryDataSource {
  ApiManager apiManager;

  @factoryMethod
  MoviesBasedOnCategoryDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> getMoviesBasedOnCategory(String categoryId) {
    return apiManager.getMoviesBasedOnCategory(categoryId);
  }
}
