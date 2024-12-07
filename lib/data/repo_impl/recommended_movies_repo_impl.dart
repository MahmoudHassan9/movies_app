import 'package:movies_app/data/data_source_contract/recommended_movies_data_source_contract.dart';
import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';
import 'package:movies_app/result.dart';

class RecommendedMoviesRepoImpl extends RecommendedMoviesRepo {
  RecommendedMoviesDataSource recommendedMoviesDataSource;

  RecommendedMoviesRepoImpl({required this.recommendedMoviesDataSource});

  @override
  Future<Result<List<RecommendedMovie>>> getRecommendedMovies() async {
    var result = await recommendedMoviesDataSource.getRecommendedMovies();
    switch (result) {
      case Success<List<RecommendedMovie>>():
        return Success(data: result.data);
      case Error<List<RecommendedMovie>>():
        return Error(exception: result.exception);
    }
  }
}
