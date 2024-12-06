import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/result.dart';

abstract class PopularMoviesDataSource {
  Future<Result<List<PopularMovie>>> getPopularMovies();
}
