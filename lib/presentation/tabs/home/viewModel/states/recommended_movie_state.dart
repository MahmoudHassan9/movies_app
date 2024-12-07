import '../../../../../data/models/recommended_movie_response/recommended_movie.dart';

sealed class RecommendedMovieState {}

class GetRecommendedMovieInitialState extends RecommendedMovieState {}

class GetRecommendedMovieLoadingState extends RecommendedMovieState {}

class GetRecommendedMovieSuccessState extends RecommendedMovieState {
  List<RecommendedMovie> list;

  GetRecommendedMovieSuccessState({required this.list});
}

class GetRecommendedMovieErrorState extends RecommendedMovieState {
  Exception exception;

  GetRecommendedMovieErrorState({required this.exception});
}
