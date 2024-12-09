import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';
import 'package:movies_app/domain/repo_contract/watch_list_movies_repo.dart';
import 'package:movies_app/result.dart';

import '../../data/models/movie.dart';

class WatchListMoviesUseCase {
  WatchListMoviesRepo watchListMoviesRepo;

  WatchListMoviesUseCase({required this.watchListMoviesRepo});

  Future<Result<List<Movie>>> getWatchListMovies() {
    return watchListMoviesRepo.getWatchListMovies();
  }

  Future<Result<bool>> addToWatchListMovies(Movie movie) {
    return watchListMoviesRepo.addToWatchListMovies(movie);
  }
}
