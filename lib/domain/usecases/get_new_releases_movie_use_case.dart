import 'package:movies_app/domain/repo_contract/new_releases_movies_repo.dart';

import '../../data/models/new_release_movie_response/new_releases_movie.dart';
import '../../result.dart';

class GetNewReleasesMovieUseCase {
  NewReleaseMovieRepo repo;

  GetNewReleasesMovieUseCase({required this.repo});

  Future<Result<List<NewReleaseMovie>>> execute() {
    return repo.getNewReleasesMovies();
  }
}
