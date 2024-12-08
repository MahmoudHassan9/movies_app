import 'package:movies_app/result.dart';

import '../models/popular_movie_response/popular_movie.dart';

abstract class PopularMoviesDataSource {
  Future<Result<List<PopularMovie>>> getPopularMovies();
}
