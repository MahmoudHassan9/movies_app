import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/popular_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../../data/models/movie.dart';

@injectable
class GetPopularMoviesUseCase {
  PopularMoviesRepo repo;

  @factoryMethod
  GetPopularMoviesUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> execute() {
    return repo.getPopularMovies();
  }
}
