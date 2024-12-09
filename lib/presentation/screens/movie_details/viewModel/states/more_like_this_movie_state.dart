import '../../../../../data/models/movie.dart';

sealed class MoreLikeThisMovieState {}

class GetMoreLikeThisMovieInitialState extends MoreLikeThisMovieState {}

class GetMoreLikeThisMovieLoadingState extends MoreLikeThisMovieState {}

class GetMoreLikeThisMovieSuccessState extends MoreLikeThisMovieState {
  List<Movie> list;

  GetMoreLikeThisMovieSuccessState({required this.list});
}

class GetMoreLikeThisMovieErrorState extends MoreLikeThisMovieState {
  Exception exception;

  GetMoreLikeThisMovieErrorState({required this.exception});
}
