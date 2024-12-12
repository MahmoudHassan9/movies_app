import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/search_data_source_contract.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/domain/repo_contract/search_repo.dart';
import 'package:movies_app/result.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl extends SearchRepo {
  SearchDataSource dataSource;

  @factoryMethod
  SearchRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Movie>>> search(String query) async {
    var result = await dataSource.search(query);
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
