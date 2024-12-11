import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../result.dart';

abstract class PopularMoviesRepo{
  Future<Result<List<MovieEntity>>> getPopularMovies();
}