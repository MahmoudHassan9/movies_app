import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/watch_list_movies_data_source_contract.dart';
import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';

import 'package:movies_app/result.dart';

import '../../domain/repo_contract/watch_list_movies_repo.dart';
import '../models/movie.dart';

@Injectable(as: WatchListMoviesRepo)
class WatchListMoviesRepoImpl extends WatchListMoviesRepo {
  WatchListMoviesDataSource watchListMoviesDataSource;

  @factoryMethod
  WatchListMoviesRepoImpl({required this.watchListMoviesDataSource});

  @override
  Future<Result<bool>> addToWatchListMovies(MovieEntity movie) async {
    var result = await watchListMoviesDataSource.addToWatchListMovies(movie);
    switch (result) {
      case Success<bool>():
        return Success(data: result.data);
      case Error<bool>():
        return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<List<MovieEntity>>> getWatchListMovies() async {
    var result = await watchListMoviesDataSource.getWatchListMovies();
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
