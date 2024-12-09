import 'package:movies_app/data/api/firebase_service.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/data/models/movie_watch_list_response/movie_wacth_list.dart';

import 'package:movies_app/result.dart';

import '../data_source_contract/watch_list_movies_data_source_contract.dart';

class WatchListMoviesDataSourceImpl extends WatchListMoviesDataSource {
  FirebaseService firebaseService;

  WatchListMoviesDataSourceImpl({required this.firebaseService});

  @override
  Future<Result<List<Movie>>> getWatchListMovies() {
    return firebaseService.getWatchList();
  }

  @override
  Future<Result<bool>> addToWatchListMovies(Movie movie) {
    return firebaseService.addToWatchList(movie);
  }
}
