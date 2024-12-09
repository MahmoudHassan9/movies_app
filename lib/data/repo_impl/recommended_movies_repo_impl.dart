import 'package:movies_app/data/data_source_contract/recommended_movies_data_source_contract.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../models/movie.dart';

class RecommendedMoviesRepoImpl extends RecommendedMoviesRepo {
  RecommendedMoviesDataSource recommendedMoviesDataSource;

  RecommendedMoviesRepoImpl({required this.recommendedMoviesDataSource});

  @override
  Future<Result<List<Movie>>> getRecommendedMovies() async {
    var result = await recommendedMoviesDataSource.getRecommendedMovies();
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
