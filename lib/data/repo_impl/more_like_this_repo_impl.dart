import 'package:movies_app/data/data_source_contract/more_like_this_movies_data_source_contract.dart';
import 'package:movies_app/data/models/movie.dart';
import 'package:movies_app/domain/repo_contract/more_like_this_repo_impl.dart';
import 'package:movies_app/result.dart';

class MoreLikeThisMoviesRepoImpl extends MoreLikeThisMoviesRepo {
  MoreLikeThisMoviesDataSource moreLikeThisMoviesDataSource;

  MoreLikeThisMoviesRepoImpl({required this.moreLikeThisMoviesDataSource});

  @override
  Future<Result<List<Movie>>> getMoreLikeThisMovies(String id) async {
    var result = await moreLikeThisMoviesDataSource.getMoreLikeThisMovies(id);
    switch (result) {
      case Success<List<Movie>>():
        return Success(data: result.data);
      case Error<List<Movie>>():
        return Error(exception: result.exception);
    }
  }
}
