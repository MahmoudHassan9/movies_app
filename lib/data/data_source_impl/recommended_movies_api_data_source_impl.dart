import 'package:injectable/injectable.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/recommended_movies_data_source_contract.dart';
import 'package:movies_app/result.dart';

import '../models/movie.dart';

@Injectable(as: RecommendedMoviesDataSource)
class RecommendedMoviesApiDataSourceImpl extends RecommendedMoviesDataSource {
  ApiManager apiManager;

  @factoryMethod
  RecommendedMoviesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> getRecommendedMovies() {
    return apiManager.getRecommendedMovies();
  }
}
