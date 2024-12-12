import 'package:movies_app/data/models/movie.dart';

import '../../result.dart';

abstract class SearchDataSource {
  Future<Result<List<Movie>>> search(String query);
}
