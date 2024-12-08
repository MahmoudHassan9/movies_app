import '../../result.dart';
import '../models/movie.dart';

abstract class MoreLikeThisMoviesDataSource{
  Future<Result<List<Movie>>> getMoreLikeThisMovies(String id);

}