import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/popular_movies_repo.dart';
import '../models/movie.dart';

@Injectable(as: PopularMoviesRepo)
class PopularMoviesRepoImpl extends PopularMoviesRepo {
  PopularMoviesDataSource dataSource;

  @factoryMethod
  PopularMoviesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<MovieEntity>>> getPopularMovies() async {
    var result = await dataSource.getPopularMovies();
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
