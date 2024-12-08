import 'package:movies_app/data/data_source_contract/new_releases_movies_data_source_contract.dart';
import 'package:movies_app/data/models/new_release_movie_response/new_releases_movie.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/new_releases_movies_repo.dart';

class NewReleaseMovieRepoImpl extends NewReleaseMovieRepo {
  NewReleasesMoviesDataSource newReleasesMoviesDataSource;

  NewReleaseMovieRepoImpl({required this.newReleasesMoviesDataSource});

  @override
  Future<Result<List<NewReleaseMovie>>> getNewReleasesMovies() async {
    var result = await newReleasesMoviesDataSource.getNewReleasesMovies();
    switch (result) {
      case Success<List<NewReleaseMovie>>():
        return Success(data: result.data);
      case Error<List<NewReleaseMovie>>():
        return Error(exception: result.exception);
    }
  }
}
