import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/new_releases_movies_data_source_contract.dart';
import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';
import 'package:movies_app/data/models/new_release_movie_response/new_releases_movie.dart';
import 'package:movies_app/result.dart';

import '../models/popular_movie_response/popular_movie.dart';

class NewReleasesMoviesDataSourceImpl extends NewReleasesMoviesDataSource {
  ApiManager apiManager;

  NewReleasesMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<NewReleaseMovie>>> getNewReleasesMovies() {
    return apiManager.getNewReleasesMovies();
  }
}
