import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/models/movie_categories/Genres.dart';

import 'package:movies_app/result.dart';

import '../data_source_contract/categories_data_source_contract.dart';


@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  CategoriesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Category>>> getCategories() {
    return apiManager.getCategories();
  }
}
