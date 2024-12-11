
import 'package:movies_app/domain/entity/movie_entity.dart';

import '../../../../../data/models/movie.dart';

sealed class RecommendedMovieState {}

class GetRecommendedMovieInitialState extends RecommendedMovieState {}

class GetRecommendedMovieLoadingState extends RecommendedMovieState {}

class GetRecommendedMovieSuccessState extends RecommendedMovieState {
  List<MovieEntity> list;

  GetRecommendedMovieSuccessState({required this.list});
}

class GetRecommendedMovieErrorState extends RecommendedMovieState {
  Exception exception;

  GetRecommendedMovieErrorState({required this.exception});
}
