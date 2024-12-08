import 'package:movies_app/domain/repo_contract/new_releases_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';

class GetNewReleasesMovieUseCase {
  NewReleaseMovieRepo repo;

  GetNewReleasesMovieUseCase({required this.repo});

  Future<Result<List<Movie>>> execute() {
    return repo.getNewReleasesMovies();
  }
}
