import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';
import '../repo_contract/more_like_this_repo_impl.dart';

class GetMoreLikeThisMoviesUseCase {
  MoreLikeThisMoviesRepo repo;

  GetMoreLikeThisMoviesUseCase({required this.repo});

  Future<Result<List<Movie>>> execute(String id) {
    return repo.getMoreLikeThisMovies(id);
  }
}
