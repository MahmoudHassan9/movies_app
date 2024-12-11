import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/new_releases_movies_data_source_contract.dart';
import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';
import 'package:movies_app/result.dart';

import '../models/movie.dart';

@Injectable(as: NewReleasesMoviesDataSource)
class NewReleasesMoviesDataSourceImpl extends NewReleasesMoviesDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewReleasesMoviesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> getNewReleasesMovies() {
    return apiManager.getNewReleasesMovies();
  }
}
