import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';

import '../../result.dart';

abstract class RecommendedMoviesDataSource{
  Future<Result<List<RecommendedMovie>>> getRecommendedMovies();

}