
import '../../../../../data/models/movie.dart';

sealed class RecommendedMovieState {}

class GetRecommendedMovieInitialState extends RecommendedMovieState {}

class GetRecommendedMovieLoadingState extends RecommendedMovieState {}

class GetRecommendedMovieSuccessState extends RecommendedMovieState {
  List<Movie> list;

  GetRecommendedMovieSuccessState({required this.list});
}

class GetRecommendedMovieErrorState extends RecommendedMovieState {
  Exception exception;

  GetRecommendedMovieErrorState({required this.exception});
}
