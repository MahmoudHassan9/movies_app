import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/search_data_source_contract.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/result.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl extends SearchDataSource {
  ApiManager apiManager;

  @factoryMethod
  SearchDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> search(String query) {
    return apiManager.getSearchResults(query);
  }
}
