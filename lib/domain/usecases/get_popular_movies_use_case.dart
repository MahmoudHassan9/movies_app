import 'package:movies_app/domain/repo_contract/popular_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../../data/models/movie.dart';


class GetPopularMoviesUseCase {
  PopularMoviesRepo repo;

  GetPopularMoviesUseCase({required this.repo});

  Future<Result<List<Movie>>>execute() {
    return repo.getPopularMovies();
  }
}
