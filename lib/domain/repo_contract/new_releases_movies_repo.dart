import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

abstract class NewReleaseMovieRepo {
  Future<Result<List<MovieEntity>>> getNewReleasesMovies();
}
