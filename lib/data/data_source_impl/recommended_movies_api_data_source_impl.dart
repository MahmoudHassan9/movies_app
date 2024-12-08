import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/recommended_movies_data_source_contract.dart';
import 'package:movies_app/data/models/recommended_movie_response/recommended_movie.dart';
import 'package:movies_app/result.dart';

class RecommendedMoviesApiDataSourceImpl extends RecommendedMoviesDataSource {
  ApiManager apiManager;

  RecommendedMoviesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<RecommendedMovie>>> getRecommendedMovies() {
    return apiManager.getRecommendedMovies();
  }
}
