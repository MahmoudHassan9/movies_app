import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/data_source_contract/more_like_this_movies_data_source_contract.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/result.dart';

class MoreLikeThisMoviesApiDataSourceImpl extends MoreLikeThisMoviesDataSource {
  ApiManager apiManager;

  MoreLikeThisMoviesApiDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Movie>>> getMoreLikeThisMovies(String id) {
    return apiManager.getMoresLikeThisMovies(id);
  }
}
