import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';

import '../../result.dart';

class GetRecommendedMoviesUseCase {
  RecommendedMoviesRepo repo;

  GetRecommendedMoviesUseCase({required this.repo});

  Future<Result<List<RecommendedMovie>>> execute() {
    return repo.getRecommendedMovies();
  }
}
