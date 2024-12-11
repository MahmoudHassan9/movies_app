import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

abstract class RecommendedMoviesRepo{
  Future<Result<List<MovieEntity>>> getRecommendedMovies();

}