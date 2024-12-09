import 'package:movies_app/result.dart';

import '../models/movie.dart';


abstract class PopularMoviesDataSource {
  Future<Result<List<Movie>>> getPopularMovies();
}
