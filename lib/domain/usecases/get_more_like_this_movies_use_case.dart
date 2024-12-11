import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entity/movie_entity.dart';
import 'package:movies_app/domain/repo_contract/recommended_movies_repo.dart';

import '../../data/models/movie.dart';
import '../../result.dart';
import '../repo_contract/more_like_this_repo_impl.dart';

@injectable
class GetMoreLikeThisMoviesUseCase {
  MoreLikeThisMoviesRepo repo;

  @factoryMethod
  GetMoreLikeThisMoviesUseCase({required this.repo});

  Future<Result<List<MovieEntity>>> execute(String id) {
    return repo.getMoreLikeThisMovies(id);
  }
}
