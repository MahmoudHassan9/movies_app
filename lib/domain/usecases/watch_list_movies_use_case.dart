import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/watch_list_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../../data/models/movie.dart';

@injectable
class WatchListMoviesUseCase {
  WatchListMoviesRepo watchListMoviesRepo;

  @factoryMethod
  WatchListMoviesUseCase({required this.watchListMoviesRepo});

  Future<Result<List<MovieEntity>>> getWatchListMovies() {
    return watchListMoviesRepo.getWatchListMovies();
  }

  Future<Result<bool>> addToWatchListMovies(MovieEntity movie) {
    return watchListMoviesRepo.addToWatchListMovies(movie);
  }
}
