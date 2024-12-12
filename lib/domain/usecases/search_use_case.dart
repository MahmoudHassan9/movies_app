import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repo_contract/search_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

@injectable
class SearchUseCase {
  SearchRepo repo;

  @factoryMethod
  SearchUseCase({required this.repo});

  Future<Result<List<Movie>>> execute(String query) {
    return repo.search(query);
  }
}
