import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/recommended_movies_data_source_contract.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../models/movie.dart';

@Injectable(as: RecommendedMoviesRepo)
class RecommendedMoviesRepoImpl extends RecommendedMoviesRepo {
  RecommendedMoviesDataSource recommendedMoviesDataSource;

  @factoryMethod
  RecommendedMoviesRepoImpl({required this.recommendedMoviesDataSource});

  @override
  Future<Result<List<MovieEntity>>> getRecommendedMovies() async {
    var result = await recommendedMoviesDataSource.getRecommendedMovies();
    switch (result) {
      case Success<List<Movie>>():
        return Success(
          data: result.data
              .map(
                (movie) => movie.toMovieEntity(),
              )
              .toList(),
        );
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
