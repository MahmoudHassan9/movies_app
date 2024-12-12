import '../../data/models/movie.dart';
import '../../result.dart';

abstract class SearchRepo {
  Future<Result<List<Movie>>> search(String query);
}
