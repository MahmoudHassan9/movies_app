import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/popular_movies_data_source_contract.dart';
import 'package:movies_app/data/models/popular_movie.dart';
import 'package:movies_app/result.dart';

class PopularMoviesApiDataSourceImpl extends PopularMoviesDataSource {
  ApiManager apiManager;

  PopularMoviesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<PopularMovie>>> getPopularMovies() {
    return apiManager.getPopularMovies();
  }
}
