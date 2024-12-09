import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

class GetRecommendedMoviesUseCase {
  RecommendedMoviesRepo repo;

  GetRecommendedMoviesUseCase({required this.repo});

  Future<Result<List<Movie>>> execute() {
    return repo.getRecommendedMovies();
  }
}
