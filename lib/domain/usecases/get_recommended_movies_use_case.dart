import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

@injectable
class GetRecommendedMoviesUseCase {
  RecommendedMoviesRepo repo;

  @factoryMethod
  GetRecommendedMoviesUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> execute() {
    return repo.getRecommendedMovies();
  }
}
