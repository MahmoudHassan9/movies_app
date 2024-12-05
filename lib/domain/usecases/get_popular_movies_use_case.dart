import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/domain/repo_contract/popular_movies_repo.dart';
import 'package:movies_app/result.dart';

class GetPopularMoviesUseCase {
  PopularMoviesRepo repo;

  GetPopularMoviesUseCase({required this.repo});

  Future<Result<List<PopularMovie>>>execute() {
    return repo.getPopularMovies();
  }
}
