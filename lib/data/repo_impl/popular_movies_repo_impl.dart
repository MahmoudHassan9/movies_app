import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';
import 'package:movies_app/data/models/popular_movie.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/popular_movies_repo.dart';

class PopularMoviesRepoImpl extends PopularMoviesRepo {
  PopularMoviesDataSource dataSource;

  PopularMoviesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<PopularMovie>>> getPopularMovies() async {
    var result = await dataSource.getPopularMovies();
    switch (result) {
      case Success<List<PopularMovie>>():
        return Success(data: result.data);
      case Error<List<PopularMovie>>():
        return Error(exception: result.exception);
    }
  }
}
