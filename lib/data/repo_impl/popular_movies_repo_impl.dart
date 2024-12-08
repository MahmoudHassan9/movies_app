import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/popular_movies_repo.dart';
import '../models/movie.dart';

class PopularMoviesRepoImpl extends PopularMoviesRepo {
  PopularMoviesDataSource dataSource;

  PopularMoviesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<Movie>>> getPopularMovies() async {
    var result = await dataSource.getPopularMovies();
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
