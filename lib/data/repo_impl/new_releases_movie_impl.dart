import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/new_releases_movies_data_source_contract.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/new_releases_movies_repo.dart';
import '../models/movie.dart';

@Injectable(as: NewReleaseMovieRepo)
class NewReleaseMovieRepoImpl extends NewReleaseMovieRepo {
  NewReleasesMoviesDataSource newReleasesMoviesDataSource;

  @factoryMethod
  NewReleaseMovieRepoImpl({required this.newReleasesMoviesDataSource});

  @override
  Future<Result<List<MovieEntity>>> getNewReleasesMovies() async {
    var result = await newReleasesMoviesDataSource.getNewReleasesMovies();
    switch (result) {
      case Success<List<Movie>>():
        return Success(
          data: result.data
              .map(
                (movie) => movie.toMovieEntity(),
              )
              .toList(),
        );
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
