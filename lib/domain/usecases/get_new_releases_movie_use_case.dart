import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/new_releases_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

@injectable
class GetNewReleasesMovieUseCase {
  NewReleaseMovieRepo repo;

  @factoryMethod
  GetNewReleasesMovieUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> execute() {
    return repo.getNewReleasesMovies();
  }
}
